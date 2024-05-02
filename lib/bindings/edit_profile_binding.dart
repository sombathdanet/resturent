import 'package:get/get.dart';
import 'package:restaurant_app/repository/user_repo.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/edit_profile_controller.dart';
import '../screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>UserRepo());
    Get.put(MainProfileController(userRepo: Get.find()));
    Get.put(EditProfileController(Get.find()));
  }
}
