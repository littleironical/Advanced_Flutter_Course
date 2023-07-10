import 'package:advanced_flutter_course/presentation/forgot_password/forgot_password.dart';
import 'package:advanced_flutter_course/presentation/home/home.dart';
import 'package:advanced_flutter_course/presentation/login/login.dart';
import 'package:advanced_flutter_course/presentation/onboarding/onboarding.dart';
import 'package:advanced_flutter_course/presentation/register/register.dart';
import 'package:advanced_flutter_course/presentation/resources/colors_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/fonts_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/styles_manager.dart';
import 'package:advanced_flutter_course/presentation/splash/splash.dart';
import 'package:advanced_flutter_course/presentation/store_details/store_details.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> route(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesManager.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutesManager.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case RoutesManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesManager.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            StringManager.noRouteFound,
            style: semiBoldTextStyleManager(
              color: ColorManager.error,
              fontSize: FontSizeManager.s18,
            ),
          ),
        ),
      ),
    );
  }
}
