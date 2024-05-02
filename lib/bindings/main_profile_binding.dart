import 'package:get/get.dart';
import 'package:restaurant_app/repository/user_repo.dart';
import '../screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';

class MainProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>UserRepo());
    Get.put(MainProfileController(userRepo: Get.find()));
  }
}
