import 'package:dio/dio.dart';
import '../local/cache_helper.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['lang'] = 'en';
    options.headers['Content-Type'] = 'application/json';
    options.headers['Authorization'] = CacheHelper.getData(key: 'token');
    super.onRequest(options, handler);
  }
}
