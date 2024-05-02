import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/constants/app_constant.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/screens/user_screen/auth_screen/local_storage/local_storage_manager.dart';
import '../../../../model/user_model/user_profile_model.dart';
import '../../../../repository/user_repo.dart';
import '../../../../routes/app_routes.dart';
import '../../Widget/show_snackbar.dart';

class MainProfileController extends GetxController{
  final UserRepo userRepo;
  final userProfile = Rx<UserProfileModel?>(null);
  Rx<bool> isLoading = false.obs;
  Rx<String> profilePic = ''.obs;

  MainProfileController({required this.userRepo});
  @override

  final HomeController homeController = Get.find();
  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }
  getUserProfile()async{
    try{
      final res = await userRepo.getUserProfile();
      if(res.status == 200){
        userProfile.value = res;
        homeController.getLocationById();
        isLoading.value = true;
      }
    }on DioException catch(e){
      showErrorSnackBar(message: e.response?.data!);
    }
  }
  logout(){
    LocalStorageManager.instance.clear(ServerRout.keyToken);
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}