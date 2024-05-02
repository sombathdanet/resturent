import 'package:dio/dio.dart';
import '../constants/app_constant.dart';
import '../screens/user_screen/auth_screen/local_storage/local_storage_manager.dart';

class GetXClient {
  static String token = ServerRout.basicToken;
  late Dio _dio;

  GetXClient._internal() {
    _dio = Dio(BaseOptions(
        baseUrl: ServerRout.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Authorization": token,
        },
        responseType: ResponseType.json))
      ..interceptors.addAll([LogInterceptor()]);
  }
  static final instance = GetXClient._internal();

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      String? newToken = await LocalStorageManager.instance
          .getFromCache(key: ServerRout.keyToken);
      final res = await _dio.get(path,
          queryParameters: queryParameters,
          options: Options(
              headers: {
                'Authorization': "Bearer ${newToken ?? token}",
              }
          ));
      if (res.statusCode == 200) {
        return res.data;
      }
      throw ("Opp Something went wrong");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post({required String path, dynamic data, String contentType = "application/json"}) async {
    String? newToken = await LocalStorageManager.instance
        .getFromCache(key: ServerRout.keyToken);
    try {
      final res = await _dio.post(
        path,
        data: data,
        options: Options(
          headers: {
            'Authorization': newToken?.isNotEmpty == true && newToken != null
                ? "Bearer $newToken"
                : token,
            'Content-Type': contentType
          },
        ),
      );
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put({
    required String path,
    dynamic data,
  }) async {
    String? newToken = await LocalStorageManager.instance
        .getFromCache(key: ServerRout.keyToken);
    try {
      final res = await _dio.put(
        path,
        data: data,
        options:
            Options(headers: {'Authorization': "Bearer ${newToken ?? token}"}),
      );
      if (res.statusCode == 200) {
        return res.data;
      }
      throw ("Some went wrong");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch({
    required String path,
     dynamic data,
  }) async {
    String? newToken = await LocalStorageManager.instance
        .getFromCache(key: ServerRout.keyToken);
    try {
      final res = await _dio.patch(
          path,
          data: data,
          options: Options(headers: {'Authorization': "Bearer ${newToken ?? token}"}),
      );
      if (res.statusCode == 200) {
        return res.data;
      }
      throw "Opp some thing went wrong patch";
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({
    required String path,
    dynamic data,
  }) async {
    String? newToken = await LocalStorageManager.instance
        .getFromCache(key: ServerRout.keyToken);
    try {
      final res = await _dio.delete(
        path,
        data: data,
        options: Options(headers: {'Authorization': "Bearer ${newToken ?? token}"}),
      );
      if (res.statusCode == 200) {
        return res.data;
      }
      throw "Opp some thing went wrong patch";
    } catch (e) {
      rethrow;
    }
  }
}
