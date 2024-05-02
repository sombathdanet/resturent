import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  Rx<bool> isPNumber = false.obs;
  void isPhoneNumber(){
    isPNumber.value =!isPNumber.value;
  }
}