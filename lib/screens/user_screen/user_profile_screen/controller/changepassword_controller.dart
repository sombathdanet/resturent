import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/model/auth_model/response_model.dart';
import 'package:restaurant_app/model/user_model/changepassmodel.dart';
import 'package:restaurant_app/repository/user_repo.dart';
import 'package:restaurant_app/screens/user_screen/Widget/show_snackbar.dart';

import '../../../../model/user_model/chnagepassrespone.dart';

class ChangePassController extends GetxController{
  final UserRepo userRepo;
  late TextEditingController oldPassController;
  late TextEditingController newPassController;
  late TextEditingController confPassController;
  ChangePassController(this.userRepo){
     oldPassController = TextEditingController();
     newPassController = TextEditingController();
     confPassController = TextEditingController();
  }
  Future<void> changePassword()async{
    try{
      String oldPassword = oldPassController.text;
      String newPassword = newPassController.text;
      String confirmPassword = confPassController.text;
      if(oldPassword.isEmpty){
        showErrorSnackBar(message: "Type your old Password");
      }else if(newPassword.isEmpty){
        showErrorSnackBar(message: "Type your new Password");
      }else if(confirmPassword.isEmpty){
        showErrorSnackBar(message: "Type your confirm Password");
      }else{
        ChangePassModel changePassModel = ChangePassModel(oldPassword: oldPassword, password: newPassword, confirmPassword: confirmPassword,);
        final res = await userRepo.changePass(changePassModel);
        if(res.status==200){
          showErrorSnackBar(message: res.message!,title: "SuccessFully");
        }
      }
    }on DioException catch (e) {
      final list = ChangePassResponse.fromJson(e.response?.data);
      showErrorSnackBar(message: list.message.toString(),title: "Error");
    }
  }
}