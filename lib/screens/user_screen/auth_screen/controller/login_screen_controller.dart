import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/model/auth_model/login_model.dart';
import 'package:restaurant_app/model/auth_model/response_model.dart';
import 'package:restaurant_app/model/user_model/user_profile_model.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';
import '../../../../repository/auth_repo.dart';
import '../../../../routes/app_routes.dart';


class LoginController extends GetxController{
  final AuthRepo authRepo;
  RxBool isLoading = false.obs;

  LoginController({required this.authRepo});
  Future<void> login(LoginModel loginModel) async {
    try{
      final res = await authRepo.login(loginModel);
      if(res.status == 200){
        isLoading.value = true;
        authRepo.saveToken(res.data!.token!);
        Get.offAllNamed(AppRoutes.homeScreenContainer);
      }
    }on DioException catch(e){
      final list = LoginResponse.fromJson(e.response?.data);
      showErrorSnackBar(message: list.message.toString());
    }
  }
  @override
  void onClose() {
    // Dispose of any resources or clean up logic when the controller is closed
    super.onClose();
  }
}