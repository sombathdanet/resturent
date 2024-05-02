import 'package:get/get.dart';
import 'package:restaurant_app/screens/user_screen/auth_screen/controller/login_screen_controller.dart';
import 'package:restaurant_app/screens/user_screen/auth_screen/controller/sign_up_controller.dart';

import '../repository/auth_repo.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthRepo());
    Get.put(SignUpController( Get.find()));
  }
}
