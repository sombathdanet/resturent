// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:restaurant_app/screens/location_screen/controller/location_controller.dart';
//
// class GoogleMapScreen extends StatelessWidget {
//    GoogleMapScreen({super.key});
//    final locationController = Get.find<LocationController>();
//   @override
//   Widget build(BuildContext context) {
//     late GoogleMapController googleMapController;
//     return GetBuilder<LocationController>(
//       builder:(_)=> Scaffold(
//         body: GoogleMap(
//           initialCameraPosition: locationController.initCameraPosition,
//           markers: locationController.marker,
//           zoomControlsEnabled: false,
//           mapType: MapType.normal,
//           onMapCreated: (GoogleMapController controller){
//             googleMapController = controller;
//           },
//         ),
//         floatingActionButton: FloatingActionButton.extended(
//             onPressed: ()async{
//                await  locationController.getCurrentLocation(googleMapController);
//             },
//             label: const Text("Use current Location"),
//           icon: const Icon(Icons.location_history),
//         ),
//       ),
//     );
//   }
// }
