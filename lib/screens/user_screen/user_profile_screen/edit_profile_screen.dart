import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/model/user_model/user_profile_model.dart';
import 'package:restaurant_app/model/user_model/userupdatemodel.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/edit_profile_controller.dart';
import '../../../../components/custom_elevated_button.dart';
import '../../../../components/custom_image_view.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../themes/theme_helper.dart';
import '../Widget/background_profile.dart';
import '../Widget/reuse_input_text.dart';
import 'controller/main_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final MainProfileController mainProfileController = Get.find();
  final EditProfileController editProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Obx(() => mainProfileController.isLoading.value
            ? _buildBody(mainProfileController)
            : const Center(child: CircularProgressIndicator())));
  }

  Widget _buildBody(MainProfileController mainProfileController) {

    var nameController = editProfileController.userNameController;
    var genderController = editProfileController.genderController;
    var phoneController = editProfileController.phoneController;
    update() {
      String name = nameController.text.trim();
      String gender  = genderController.text.trim();
      String phone = phoneController.text.trim();
      UpdateProfileModel updateProfileModel = UpdateProfileModel(
        name:name,
        gender: gender,
        phone: phone,
        avatar: mainProfileController.userProfile.value!.data?.avatar
      );
      editProfileController.updateProfile(updateProfileModel);
    }
    return Stack(
      children: [
        const BackGroundProfile(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h)),
          ),
          child: Column(
            children: [
              _buildProfileAndName(mainProfileController),
              _buildDescription(),
              SizedBox(
                height: 20.v,
              ),
              TextFieldInput(
                iconData: Icons.person,
                text: "Edit",
                controller: editProfileController.userNameController,
              ),
              TextFieldInput(
                iconData: Icons.percent,
                text: "Change",
                controller: editProfileController.genderController,
              ),
              TextFieldInput(
                iconData: Icons.phone,
                text: "Change",
                controller: editProfileController.phoneController,
              ),
              TextFieldInput(
                iconData: null,
                imagePath: ImageConstant.lockIcon,
                text: "Change",
                controller: editProfileController.passwordController,
                onTap: (){
                  Get.toNamed(AppRoutes.changePassScreen);
                },
              ),
              SizedBox(
                height: 20.v,
              ),
              CustomElevatedButton(
                onPressed: (){
                  update();
                },
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                text: 'Save Change',
                buttonTextStyle: const TextStyle(color: Colors.white),
                buttonStyle: CustomButtonStyles.fillOrange,
              ),
            ],
          ),
        )
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 80.v,
      centerTitle: true,
      leading: Padding(
          padding: EdgeInsets.only(top: 5.v),
          child: IconButton(
              onPressed: () {
                onTapVector();
              },
              icon:   Icon(Icons.arrow_back_ios,color: Colors.white,size: 16.h,))),
      backgroundColor: Colors.deepPurple.withOpacity(0.7),
      title: Padding(
        padding: EdgeInsets.only(top: 5.v),
        child: Text(
          "Edit Profile",
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAndName(MainProfileController mainProfileController) {
    UserProfileModel? userProfile = mainProfileController.userProfile.value;
    return Padding(
      padding: EdgeInsets.only(top: 10.v),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 45.v,
                backgroundImage: CachedNetworkImageProvider(mainProfileController.userProfile.value!.data!.avatar!)
              ),
              Positioned(
                bottom: 0,
                right: -10.h,
                child: Container(
                  alignment: Alignment.center,
                  width: 30.h,
                  height: 30.v,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: CustomImageView(
                    onTap: (){
                      editProfileController.pickImageAndUploads();
                    },
                    width: 15.h,
                    height: 15.v,
                    imagePath: ImageConstant.pencil,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Text(
            userProfile!.data!.name!,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Text(
        "Amet minim mollit non deserunt ullamco estsit aliqua dolor do amet sint.Verlit officia.",
        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }

  void onTapVector() {
    Get.back();
  }
}
