import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/user_screen/auth_screen/controller/sign_up_controller.dart';
import '../../../../components/custom_elevated_button.dart';
import '../../../../components/custom_field_view.dart';
import '../../../../components/custom_outline_button.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../themes/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/custom_text_style.dart';
import '../Widget/appbar_for_user_screen.dart';
import '../Widget/background_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    final SignUpController controller = Get.find();
    return Form(
      child: GetBuilder<SignUpController>(
        builder:(_) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarForUser(text: "Sign Up"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageConstant.LOGO),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Username",
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              // Email TextField
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFieldView(
                    controller: controller.userNameController,
                    autofocus: false,
                    onChanged: (String value) {},
                    validator: (val) {
                      return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Email",
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
               // Email TextField
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFieldView(
                    controller: controller.emailController,
                    autofocus: false,
                    onChanged: (String value) {},
                    validator: (val) {
                      return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Gender",
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              _buildDropDown(_),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Password",
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              // Password TextField
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFieldView(
                    controller: controller.passwordController,
                    onChanged: (String value) {},
                    autofocus: false,
                    validator: (val){
                      return   RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$').hasMatch(val!)?null :"Password not strong ";
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Confirm password",
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              // Password TextField
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFieldView(
                    controller: controller.cfPassController,
                    onChanged: (String value) {},
                    autofocus: false,
                    validator: (val){
                      return   RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$').hasMatch(val!)?null :"Password not strong ";
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Phone",
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              // Password TextField
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFieldView(
                    controller: controller.phoneController,
                    textInputType: TextInputType.phone,
                    onChanged: (String value) {},
                    autofocus: false,
                    validator: (val){
                      return   RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$').hasMatch(val!)?null :"Password not strong ";
                    },
                  )),
              SizedBox(height: 10.v,),
              // ContainerButton(text: "Sign Up",onTap: (){},),
              CustomElevatedButton(
                onPressed: (){
                  controller.signUp();
                },
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                text: 'Sign Up',
                buttonTextStyle: const TextStyle(color: Colors.white),
                buttonStyle: CustomButtonStyles.fillOrange,
              ),
              _buildDivider(),
              CustomOutlinedButton(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                buttonTextStyle: const TextStyle(color: Colors.black),
                leftIcon: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgFacebook1),
                          fit: BoxFit.cover)),
                ),
                text: 'Sign Up with Facebook',
              ),
              CustomOutlinedButton(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                buttonTextStyle: const TextStyle(color: Colors.black),
                leftIcon: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgGoogle),
                          fit: BoxFit.cover)),
                ),
                text: 'Sign Up with Google',
              ),
              _buildHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDropDown(SignUpController controller){
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.v,horizontal: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.circular(6.h),
            border: Border.all(color: appTheme.blueGray100,width: 1)
        ),
        child: DropdownButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          value: controller.male,
          isExpanded: true,
          onChanged: (String? newValue) {
            if (newValue != null) {
              controller.changeValue(newValue);
            }
          },
          style: CustomTextStyles.bodySmallGray500.copyWith(
            color: appTheme.gray800,
            fontSize: 15.0,
          ),
          underline: const SizedBox.shrink(),
          items: [
            DropdownMenuItem<String>(
              value: controller.male1, // Replace "Value1" with your actual value
              child:  Text(controller.male1.toString()), // Replace "Item 1" with your actual item
            ),
            DropdownMenuItem<String>(
              value: controller.female, // Replace "Value2" with your actual value
              child: Text(controller.female.toString()), // Replace "Item 2" with your actual item
            ),
            // Add more DropdownMenuItem as needed
          ],
        ),
      ),
    );
  }
  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Row(
        children: [
          const Flexible(
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
            style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Flexible(
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

  Widget _buildHaveAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Text("Already have an account?", style: theme.textTheme.displaySmall),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.loginScreen);
            },
            child: Text("Login",
                style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2)),
          ),
        ],
      ),
    );
  }
}
