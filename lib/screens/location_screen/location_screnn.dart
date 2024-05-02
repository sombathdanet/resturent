import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/location_screen/controller/location_controller.dart';
import 'package:restaurant_app/screens/location_screen/google_map_screen.dart';
import 'package:restaurant_app/screens/location_screen/widget/custom_list_display.dart';
import '../../components/custom_field_view.dart';
import '../../model/location_model/location_model.dart';

Future displayBottomSheet(BuildContext context, List<Datum> listLocation) {
  final locationController = Get.find<LocationController>();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: FractionalOffset.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              SizedBox(height: 12.v),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Select a location",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.v),
                child: CustomFieldView(
                  onChanged: (value){
                    locationController.searchLocation(value);
                  },
                  hintText: "Type a dish or cuisine".tr,
                  prefix: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16 .h,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.v),
               SizedBox(
                  height: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: ()async{
                          await  locationController.getCurrentLocation();
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.my_location_outlined,
                              color: Colors.red,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Use current Location',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                            Spacer(),
                            Icon(Icons.chevron_right_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
               ),
              const ListViewMap()
            ],
          ),
        ),
      ),
  );
}
