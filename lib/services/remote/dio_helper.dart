import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../injection_container.dart';
import 'dio_intercepter.dart';
import 'end_points.dart';

class DioClient {
  static var dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    // dio.interceptors.add(getIt.get<DioInterceptor>());
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          request: true,
        ),
      );
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'token': token,
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
