import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_field_view.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/theme_helper.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../routes/app_routes.dart';
import '../Widget/appbar_for_user_screen.dart';
import '../Widget/background_screen.dart';
import 'controller/forget_password_controller.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final ForgetPassController forgetController = Get.put(ForgetPassController());
  PrimaryColors colors = PrimaryColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BackGroundScreen(),
            Obx(() => _buildColumn()),
          ],
        ));
  }


  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBarForUser(text: "Forgot Password"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.LOGO),
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              forgetController.isPNumber.value ? "Phone number" : "Email",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        forgetController.isPNumber.value
            ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomFieldView(
              autofocus: false,
              hintText: "Enter Registered Phone Number",
            ))
            :  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomFieldView(
              autofocus: false,
              hintText: "Enter Registered Email",
              validator: (val) {
                return RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val!)
                    ? null
                    : "Please enter a valid email";
              },
            )),
        _buildDivider(),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {
                forgetController.isPhoneNumber();
              },
              child: Text(
                forgetController.isPNumber.value ? "Email" : "Phone Number",
                style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )),
        CustomElevatedButton(
          onPressed: (){
            Get.toNamed(AppRoutes.otpScreen);
            },
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          text: 'Send OTP',
          buttonTextStyle: const TextStyle(color: Colors.white),
          buttonStyle: CustomButtonStyles.fillOrange,
        ),
      ],
    );
  }

  Widget _buildForgetPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(
        bottom: 0.1,
      ),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0, // Underline thickness
              ))),
      child: const Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: const Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Divider(
                thickness: 0.3,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            "or",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 10),
              child: Divider(
                thickness: 0.3,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
