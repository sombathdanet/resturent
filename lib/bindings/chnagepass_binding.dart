import 'package:get/get.dart';
import 'package:restaurant_app/repository/user_repo.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/changepassword_controller.dart';


class ChangePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>UserRepo());
    Get.put(ChangePassController(Get.find()));
  }
}
