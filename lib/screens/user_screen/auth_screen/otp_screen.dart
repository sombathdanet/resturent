import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../components/custom_elevated_button.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../themes/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../Widget/appbar_for_user_screen.dart';
import '../Widget/background_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  PrimaryColors colors = PrimaryColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BackGroundScreen(),
            _buildColumn(),
          ],
        ));
  }

  Widget _buildColumn() {
    final defaultPinTheme = PinTheme(
      margin:  const EdgeInsets.symmetric(horizontal: 5),
      width: 45,
      height: 50,
      textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey
          )
        ]
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.white,
            )
          ]
      ),
    );
    return  Column(
      children: [
        const AppBarForUser(text: "Enter OTP"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.LOGO),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100,bottom: 50),
          child: Pinput(
            autofocus: false,
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
          ),
        ),
        _buildResendOtp(),
        CustomElevatedButton(
          onPressed: (){
            Get.toNamed(AppRoutes.setNewPassScreen);
          },
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          text: 'Verify',
          buttonTextStyle: const TextStyle(color: Colors.white),
          buttonStyle: CustomButtonStyles.fillOrange,
        ),
      ],
    );
  }
  Widget _buildResendOtp(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Resend OTP",style: theme.textTheme.titleMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color:colors.orange80001),)
        ],
      ),
    );
  }
}
