import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/model/user_model/changepassmodel.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/controller/changepassword_controller.dart';
import '../../../../components/custom_elevated_button.dart';
import '../../../../components/custom_field_view.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../themes/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../Widget/appbar_for_user_screen.dart';
import '../Widget/background_profile.dart';
import '../Widget/background_screen.dart';
import '../Widget/show_snackbar.dart';
import '../auth_screen/controller/forget_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ForgetPassController forgetController = Get.put(ForgetPassController());
  PrimaryColors colors = PrimaryColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            const BackGroundScreen(),
            _buildColumn()
          ],
        ));
  }

  Widget _buildColumn() {
    ChangePassController changePassController = Get.find();
    return Stack(
      children: [
        const BackGroundProfile(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    margin: EdgeInsets.only(top: 20.v),
                    imagePath: ImageConstant.lockIcon,
                    color: Colors.deepOrange,
                    width: 110.v,
                  ),
                ],
              ),
              Padding(
                  padding:  EdgeInsets.only(left: 10.h,top: 30.v,bottom: 10.h),
                  child: Text(
                    "Password",
                    style: theme.textTheme.titleMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFieldView(
                    onChanged: (value){},
                    controller: changePassController.oldPassController,
                    hintText: "Old password",
                    autofocus: false,
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Text(
                    "Password",
                    style: theme.textTheme.titleMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  child: CustomFieldView(
                    onChanged: (value){},
                    controller: changePassController.newPassController,
                    hintText: "New password",
                    autofocus: false,
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 10,right: 5),
                  child: Text(
                    "Password",
                    style: theme.textTheme.titleMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: CustomFieldView(
                    onChanged: (value){},
                    controller: changePassController.confPassController,
                    hintText: "Confirm Password",
                    autofocus: false,
                  )),
              CustomElevatedButton(
                onPressed: (){
                  changePassController.changePassword();
                },
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                text: 'Set New Password',
                buttonTextStyle: const TextStyle(color: Colors.white),
                buttonStyle: CustomButtonStyles.fillOrange,
              ),
            ],
          ),
        ),
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
          "Change Password",
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  void onTapVector() {
    Get.back();
  }
}
