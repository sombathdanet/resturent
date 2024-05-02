import 'dart:async';

import 'package:get/get.dart';

import '../../constants/app_constant.dart';
import '../../routes/app_routes.dart';
import '../user_screen/auth_screen/local_storage/local_storage_manager.dart';

class SplashScreenController extends GetxController {

  Timer? timer;

  @override
  onInit() {
    super.onInit();
    moveToHomeScreen();
  }

  @override
  onClose() {
    timer?.cancel();
  }

  moveToHomeScreen() {
    timer = Timer( const  Duration(milliseconds: 2000), () async {
      String? newToken = await LocalStorageManager.instance.getFromCache(key: ServerRout.keyToken);
      if(newToken!.isNotEmpty){
        Get.offAllNamed(AppRoutes.homeScreenContainer);
      }else{
        Get.offAllNamed(AppRoutes.loginScreen);
      }
    });
  }
}
