import 'package:restaurant_app/constants/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  static LocalStorageManager get instance => LocalStorageManager._internal();
  LocalStorageManager._internal();
  Future<SharedPreferences> _getSharePreference() async => await SharedPreferences.getInstance();

  Future<bool> saveToCache({required String key, required String value}) async{
    final pref = await _getSharePreference();
    return pref.setString(key, value);
  }
  Future<String?> getFromCache({required String key})async{
    final pref = await _getSharePreference();
    final  list = pref.getString(key) ?? "";
    return list;
  }
  void clear(String key)async {
    final pref = await _getSharePreference();
    pref.remove(key);
  }
}
