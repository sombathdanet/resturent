import 'package:restaurant_app/client/getx_client.dart';
import 'package:restaurant_app/constants/app_constant.dart';
import 'package:restaurant_app/model/auth_model/login_model.dart';
import 'package:restaurant_app/model/auth_model/sign_up_model.dart';
import '../../../../model/auth_model/response_model.dart';
import '../screens/user_screen/auth_screen/local_storage/local_storage_manager.dart';
class AuthRepo{
  Future<LoginResponse> login(LoginModel loginModel)async{
      final res = await GetXClient.instance. post(
          path: ServerRout.login,
          data: loginModel.toJson(),
      );
      return LoginResponse.fromJson(res);
  }
  saveToken(String tokens){
    LocalStorageManager.instance.saveToCache(key: ServerRout.keyToken, value: tokens);
  }
  Future<LoginResponse> signUp(SignUpModel signUpModel) async{
    final res = await GetXClient.instance.post(path: ServerRout.signUpPath,data: signUpModel.toJson());
    return LoginResponse.fromJson(res);
  }
}