import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app/constants/app_constant.dart';
import 'package:restaurant_app/model/user_model/userupdatemodel.dart';
import 'package:restaurant_app/repository/user_repo.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/main_profile_controller.dart';

import '../../../../model/user_model/update_profile_respone.dart';

class EditProfileController extends GetxController {
  final UserRepo userRepo;
  MainProfileController mainProfileController = Get.find();

  late TextEditingController userNameController;
  late TextEditingController genderController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  EditProfileController(this.userRepo) {
    // Initialize the controllers in the constructor body
    userNameController = TextEditingController(text: mainProfileController.userProfile.value!.data!.name);
    genderController = TextEditingController(text: mainProfileController.userProfile.value!.data!.gender);
    phoneController = TextEditingController(text: mainProfileController.userProfile.value!.data!.phone);
    passwordController = TextEditingController(text: "Password");
  }
  updateProfile(UpdateProfileModel updateProfileModel) async {
    try {
      final res = await userRepo.updateUserProfile(updateProfileModel);
      if (res.status == 200) {
        showErrorSnackBar(message: res.message!, title: "Profile");
        mainProfileController.userProfile.value = await userRepo.getUserProfile();
      }
    } on DioException catch (e) {
      final list = UpdateResponse.fromJson(e.response?.data);
      showErrorSnackBar(message: list.status.toString());
    }
  }

  void pickImageAndUploads() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 10);
    File file = File(image!.path);
    try {
      final res = await userRepo.uploadProfileImage(file);
      if (res.status == 200) {
        showErrorSnackBar(message: res.message!, title: "Profile");
        mainProfileController.userProfile.value =
            await userRepo.getUserProfile();
      }
    } catch (e) {
      showErrorSnackBar(message: e.toString());
    }
  }
}
