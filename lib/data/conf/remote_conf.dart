import 'package:dio/dio.dart';
import 'package:watch_store_flutter/utils/shared_pref_constant.dart';
import 'package:watch_store_flutter/utils/shared_preference.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    String? token =
        SharedPreferencesManager().getString(SharedPreferencesConstants.token);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

class DioManager {
  static final Dio _dio = Dio();

  static Dio get dio {
    _dio.interceptors.add(AuthInterceptor());
    return _dio;
  }


}
