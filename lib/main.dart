import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/auth/login/log_in_screen.dart';
import 'package:shopx/features/onboarding/onboarding_screen.dart';
import 'package:shopx/injection_container.dart';
import 'package:shopx/services/local/cache_helper.dart';
import 'package:shopx/services/remote/dio_helper.dart';

import 'app.dart';
import 'config/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioClient.init();
  await init();
  BlocOverrides.runZoned(
    () => runApp(
      const MyApp(),
    ),
    blocObserver: AppBlocObserver(),
  );
}
