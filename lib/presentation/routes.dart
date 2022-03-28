import 'package:advanced_tips/presentation/modules/auth/login/login.dart';
import 'package:advanced_tips/presentation/modules/auth/register/register.dart';
import 'package:advanced_tips/presentation/modules/on_boarding/on_boarding.dart';
import 'package:advanced_tips/presentation/modules/splash/splash.dart';
import 'package:advanced_tips/presentation/shared/resources/strings.dart';
import 'package:flutter/material.dart';

import 'modules/auth/forget_pass/forget_pass.dart';
import 'modules/main_view/main_view.dart';
import 'modules/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetpasswordRoute = "/forgetpassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
              case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.forgetpasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
