import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopx/config/routes.dart';
import 'package:shopx/features/auth/login/log_in_screen.dart';
import 'package:shopx/features/home/home_screen.dart';
import 'package:shopx/features/onboarding/onboarding_screen.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.onBoardingPageRoute:
      return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()));
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(builder: ((context) => const LoginScreen()));
    case AppRoutes.homePageRoute:
      return MaterialPageRoute(builder: ((context) => const HomeScreen()));

    default:
      return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()));
  }
}
