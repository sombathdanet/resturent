import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/custom_elevated_button.dart';
import '../../../../components/custom_field_view.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../themes/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../Widget/appbar_for_user_screen.dart';
import '../Widget/background_screen.dart';
import 'controller/forget_password_controller.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final ForgetPassController forgetController = Get.put(ForgetPassController());
  PrimaryColors colors = PrimaryColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BackGroundScreen(),
           _buildColumn()
          ],
        ));
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBarForUser(text: "Set New Password"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.LOGO),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10,top: 50,bottom: 10),
            child: Text(
              "Password",
              style: theme.textTheme.titleMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),
            )),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomFieldView(
              hintText: "Enter New Password",
              autofocus: false,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10,right: 5),
            child: Text(
              "Password",
              style: theme.textTheme.titleMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),
            )),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: CustomFieldView(
              hintText: "Confirm Password",
              autofocus: false,
            )),
        CustomElevatedButton(
          onPressed: (){
            Get.toNamed(    AppRoutes.homeScreenContainer);
          },
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          text: 'Set New Password',
          buttonTextStyle: const TextStyle(color: Colors.white),
          buttonStyle: CustomButtonStyles.fillOrange,
        ),
      ],
    );
  }
}
