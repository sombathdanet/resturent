import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/screens/user_screen/auth_screen/controller/login_screen_controller.dart';
import '../../../../components/custom_elevated_button.dart';
import '../../../../components/custom_field_view.dart';
import '../../../../components/custom_outline_button.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../themes/theme_helper.dart';
import '../../../model/auth_model/login_model.dart';
import '../../../routes/app_routes.dart';
import '../Widget/appbar_for_user_screen.dart';
import '../Widget/background_screen.dart';
import '../Widget/show_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PrimaryColors colors = PrimaryColors();
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BackGroundScreen(),
            Obx(
              () => loginController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : _buildColumn(),
            )
          ],
        ));
  }

  Widget _buildColumn() {
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    check() {
      String name = nameController.text.trim();
      String password = passwordController.text;
      if (name.isEmpty) {
        showErrorSnackBar(message: "Type your name");
      } else if (password.isEmpty) {
        showErrorSnackBar(message: "Type your password");
      } else {
        LoginModel userModel = LoginModel(username: name, password: password);
        loginController.login(userModel);
      }
    }
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarForUser(text: "Login"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageConstant.LOGO),
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Email",
                style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          // email textField
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomFieldView(
                onChanged: (String value) {},
                controller: nameController,
                autofocus: false,
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
                "Password",
                style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          // password textField
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomFieldView(
                onChanged: (String value) {},
                controller: passwordController,
                autofocus: false,
                validator: (val) {
                  return RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$')
                          .hasMatch(val!)
                      ? null
                      : "Password not strong ";
                },
              )),
          CustomElevatedButton(
            onPressed: () {
              check();
            },
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            text: 'Login',
            buttonTextStyle: const TextStyle(color: Colors.white),
            buttonStyle: CustomButtonStyles.fillOrange,
          ),
          _buildForgetPassword(),
          _buildDivider(),
          CustomOutlinedButton(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            text: 'Sign Up with facebook',
          ),
          CustomOutlinedButton(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
          _buildNoAccount(),
        ],
      ),
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
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.forgetScreen);
        },
        child: Text(
          "Forgot Password?",
          style: theme.textTheme.titleMedium?.copyWith(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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

  Widget _buildNoAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Text("New to CRAVE?", style: theme.textTheme.displaySmall),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.signUpScreen);
            },
            child: Text("Sign Up",
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
