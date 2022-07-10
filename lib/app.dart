import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/auth/login/cubit/login_cubit.dart';
import 'package:shopx/features/auth/login/log_in_screen.dart';
import 'package:shopx/features/home/cubit/home_cubit.dart';
import 'package:shopx/features/home/home_screen.dart';
import 'package:shopx/services/local/cache_helper.dart';

import 'config/router.dart';
import 'config/theme/app_theme.dart';
import 'features/onboarding/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget widget;
    final onBoardingFinish = CacheHelper.getData(key: 'on-boarding');
    final tokenValue = CacheHelper.getData(key: 'token');
    if (onBoardingFinish != null) {
      if (tokenValue != null) {
        widget = const HomeScreen();
      } else {
        widget = const LoginScreen();
      }
    } else {
      widget = const OnboardingScreen();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => LoginCubit())),
        BlocProvider(create: ((context) => HomeCubit()..getHomeData())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightThemeData(),
        home: widget,
        onGenerateRoute: onGenerate,
        initialRoute: '/',
      ),
    );
  }
}
