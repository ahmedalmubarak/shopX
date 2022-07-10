import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopx/config/routes.dart';
import 'package:shopx/features/auth/login/log_in_screen.dart';
import 'package:shopx/features/home/home_screen.dart';
import 'package:shopx/features/onboarding/onboarding_screen.dart';
import 'package:shopx/features/product_detail/product_detail_screen.dart';
import 'package:shopx/model/home_model/home_model.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.onBoardingPageRoute:
      return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()));
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(builder: ((context) => const LoginScreen()));
    case AppRoutes.homePageRoute:
      return MaterialPageRoute(builder: ((context) => const HomeScreen()));
    case AppRoutes.productDetailPageRoute:
      return MaterialPageRoute(
          builder: ((context) => const ProductDetailScreen()));

    default:
      return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()));
  }
}
