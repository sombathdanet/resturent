import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/model/auth_model/sign_up_model.dart';
import 'package:restaurant_app/repository/auth_repo.dart';
import 'package:restaurant_app/routes/app_routes.dart';

import '../../Widget/show_snackbar.dart';

class SignUpController extends GetxController {
  final AuthRepo authRepo;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cfPassController;
  late TextEditingController phoneController;
  SignUpController( this.authRepo){
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cfPassController = TextEditingController();
    phoneController = TextEditingController();
  }
  String male = "Male";
  String male1 = "Male";
  String female = "Female";

  changeValue(String value){
    male = value;
    update();
  }
  Timer? timer;

  Future<void> signUp()async{
    try{
      final name = userNameController.text;
      final email = emailController.text;
      final pass = passwordController.text;
      final cPass = cfPassController.text;
      final phone = phoneController.text;
      if(name.isEmpty){
        showErrorSnackBar(message: "Type your name");
      }else if(email.isEmpty){
        showErrorSnackBar(message: "Type your email");
      }else if(pass.isEmpty){
        showErrorSnackBar(message: "Type your password");
      }else if(cPass.isEmpty){
        showErrorSnackBar(message: "Type your confirm password");
      }else if(phone.isEmpty){
        showErrorSnackBar(message: "Type your phone number");
      }else {
        SignUpModel signUpModel = SignUpModel(
          name: name,
          username: name,
          email: email,
          password: pass,
          confirmPassword: cPass,
          gender: male,
          phone: phone,
          salary: 100,
          hireDate: DateFormat("yyy/MM/dd").format(DateTime.now()).toString(),
          roleId: 2,
        );
        final res = await authRepo.signUp(signUpModel);
        if(res.status == 200){
          showErrorSnackBar(message: res.message!);
          timer = Timer(const Duration(seconds: 1), () {
            Get.offAllNamed(AppRoutes.loginScreen);
          });
        }
      }
    } on DioException catch(e){
      print(e);
    }
    }
  }