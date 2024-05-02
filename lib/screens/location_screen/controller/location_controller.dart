import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/model/booking_model/respone_model_booking.dart';
import 'package:restaurant_app/model/location_model/location_respone.dart';
import 'package:restaurant_app/model/location_model/post_location_model.dart';
import 'package:restaurant_app/repository/location_repo.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';


class LocationController extends GetxController{
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission locationPermission;
  Future<Position?>  getCurrentLocation () async{
    update();
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if(!servicePermission){
      print("it's not enable");
    }
    locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
    }
    currentLocation = await Geolocator.getCurrentPosition();
    getFromCoordinate(currentLocation!);
    return currentLocation;
  }
  bool isSave = false;
  getFromSearch(String? name , String? sub)async{
    PostLocationModel? postLocationModel = PostLocationModel(
      name: name   ?? "no name",
      location: sub ?? "no location",
      googleMapUrl: "google map url",
    );
    try{
      final res = await locationRepo.addAddress(postLocationModel,mainProfileController.userProfile.value!.data!.id);
      if(res.status == 200){
        showErrorSnackBar(message: "Success",title: "Location");
        controller.current.value = controller.getLocationById();
        isSave = true;
      }
    }on DioException catch(e){
      final list =  ResModelBooking.fromJson(e.response!.data);
      showErrorSnackBar(message:list.message!);
    }
    update();
  }
  getFromCoordinate(Position position)async{
    List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude,position.longitude);
    Placemark placeMark = placeMarks[0];
    PostLocationModel? postLocationModel = PostLocationModel(
      name: placeMark.subLocality == null || placeMark.subLocality!.isEmpty ? "no sublocality" : placeMark.subLocality,
      location: placeMark.locality,
      googleMapUrl: "google map url",
    );
    print(postLocationModel.toJson());
    try{
      final res = await locationRepo.addAddress(postLocationModel,mainProfileController.userProfile.value!.data!.id);
      if(res.status == 200){
        showErrorSnackBar(message: "Success",title: "Location");
        controller.current.value = controller.getLocationById();
      }
    }on DioException catch(e){
      final list =  ResModelBooking.fromJson(e.response!.data);
      showErrorSnackBar(message:list.message!);
    }
  }
  CameraPosition initCameraPosition = const CameraPosition(target: LatLng(37.42796133580664, -122.085749655962),zoom: 14);
  Set<Marker> marker = {};

  clickShow(Position position,GoogleMapController googleMapController){
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude,position.longitude))));
    marker.clear();
    marker.add(Marker(markerId: const MarkerId("current Location"),position: LatLng(position.latitude,position.longitude)));
    update();
  }
  final MainProfileController mainProfileController = Get.find();
  final HomeController controller = Get.find();

  Future<List<Features>> searchAddress(String value)async{
    update();
    final response = await Dio().get("https://photon.komoot.io/api/",queryParameters: {"q":value,"limit":10});
    final json = response.data;
    print(json);
    return (json['features'] as List).map((e) => Features.fromJson(e)).toList();
  }
  List<Features> listLocation = [];
  void searchLocation(String value)async{
    update();
    listLocation = await searchAddress(value);
  }
}