import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/location_screen/controller/location_controller.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

class ListViewMap extends StatelessWidget {
  const ListViewMap({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.find();
    return Expanded(
      child: GetBuilder<LocationController>(
        builder:(_)=> locationController.listLocation .isEmpty ? Container(): ListView.builder(
          shrinkWrap: true,
          itemCount: locationController.listLocation.length,
          itemBuilder: (context, index) {
            final list = locationController.listLocation[index];
            return InkWell(
              onTap: (){
                locationController.getFromSearch(list.properties?.name, list.properties?.country ?? list.properties?.city ?? list.properties?.state ?? list.properties?.district);
                  locationController.isSave ?Navigator.of(context).pop(): false;
              },
              child: SizedBox(
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(
                      color: Colors.grey.shade600,
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 40,
                          color: Colors.grey.shade600,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              list.properties?.name ?? "",
                              style:  theme.textTheme.displaySmall?.copyWith(
                                  fontSize: 18.fSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              list.properties?.country ??  list.properties?.city  ?? list.properties?.state  ??  "",
                              style:  theme.textTheme.displaySmall?.copyWith(
                                fontSize: 14.fSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

