import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  );

  AuthService() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) async {
          String? token = await gettoken();
          if (token != null) {
            option.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(option);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException ex, handler) {
          if (ex.response?.statusCode == 401) {
            print("unAuthorized Access");
          }
          return handler.next(ex);
        },
      ),
    );
  }

  Future<void> savetoken(String token) async {
    SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    await sharedPreferences.setString("token", token);
  }

  Future<void> logout() async {
    SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    await sharedPreferences.remove("token");
  }

  Future<String?> gettoken() async {
    SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    await sharedPreferences.getString("token");
  }

  Future<String?> login(String username, String password) async {
    try {
      Response response = await dio.post(
        "/auth/login",
        data: {"username": username, "password": password},
      );
      if (response.statusCode == 200) {
        String token = response.data["accessToken"];
        await savetoken(token);
        return token;
      }
    } on DioException catch (ex) {
      throw Exception(handleDioError(ex));
    }
    return null;
  }

  String handleDioError(DioException exdio) {
    if (exdio.response != null) {
      return exdio.response!.data['message'] ?? 'Something Went Wrong';
    }
    return "Network Error!!! Check Internet connection";
  }
}
