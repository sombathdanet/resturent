import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/routes/app_routes.dart';

class CompleteBooking extends StatelessWidget {
  const CompleteBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Congrats!",
                    style: TextStyle(
                        color: Colors.purple[300],
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                  const Text(
                    "Your order has been placed and you will get a shipping comfirmation soon.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 60.v,
                margin: const EdgeInsets.all(40),
                width: double.infinity,
                child: FloatingActionButton(
                  child: const Text(
                    "Shop more",
                  ),
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.homeScreenContainer);
                  },
                )),
          ],
        )
      ]),
    );
  }
}
