import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopx/services/remote/dio_intercepter.dart';
import './services/remote/dio_helper.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
  getIt.registerSingleton<DioClient>(DioClient());
}
