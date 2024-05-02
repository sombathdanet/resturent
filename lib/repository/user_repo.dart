import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';
import 'package:restaurant_app/client/getx_client.dart';
import 'package:restaurant_app/constants/app_constant.dart';
import 'package:restaurant_app/model/user_model/user_profile_model.dart';
import 'package:restaurant_app/repository/upload_profile_model.dart';
import '../model/user_model/changepassmodel.dart';
import '../model/user_model/chnagepassrespone.dart';
import '../model/user_model/update_profile_respone.dart';
import '../model/user_model/userupdatemodel.dart';

class UserRepo {
  Future<UserProfileModel> getUserProfile() async {
    try {
      final res = await GetXClient.instance.get(path: ServerRout.profilePath);
      final userProfile = UserProfileModel.fromJson(res);
      return userProfile;
    } catch (error) {
      return UserProfileModel(); // Return a default or empty user profile model
    }
  }

  Future<UpdateResponse> updateUserProfile(
      UpdateProfileModel userProfileModel) async {
    final res = await GetXClient.instance.put(path: ServerRout.profilePath, data: userProfileModel.toJson());
    return UpdateResponse.fromJson(res);
  }

  uploadProfileImage(File image) async {
    final multiPath = await MultipartFile.fromFile(
      image.path,
      filename: image.path.split('/').last,
      contentType:  MediaType("image","jpeg")
    );
    var formData = FormData.fromMap({
      'file': multiPath,
      "type": "image/*",
    });
    try {
      final response = await GetXClient.instance.post(
        path: ServerRout.uploadPicPath,
        data: formData,
        contentType: 'multipart/form-data;boundary=',
      );
      return UploadProfileModel.fromJson(response);
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
  Future<ChangePassResponse> changePass(ChangePassModel changePassModel) async{
      final res = await GetXClient.instance.patch(path:ServerRout.changePassPath , data: changePassModel.toJson());
      Map<String, dynamic> map = res as Map<String, dynamic>;
      final changePassResponse = ChangePassResponse.fromJson(map);
      return changePassResponse;
  }
}
