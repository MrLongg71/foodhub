import 'package:flutter/material.dart';
import 'package:foodhub/src/module/authentication/pages/introduction_page.dart';
import 'package:foodhub/src/module/authentication/pages/sign_in_page.dart';
import 'package:foodhub/src/module/authentication/pages/sign_up_page.dart';
import 'package:foodhub/src/module/authentication/pages/splash_screen_page.dart';
import 'package:foodhub/src/module/authentication/pages/verification_code_page.dart';
import 'package:foodhub/src/module/authentication/pages/welcome_page.dart';
import 'package:foodhub/src/module/dashboard/page/dashboard_page.dart';
import 'package:foodhub/src/module/foods/pages/food_detail_page.dart';
import 'package:foodhub/src/module/foods/pages/review_page.dart';
import 'package:foodhub/src/module/home/pages/home_page.dart';

class RouteGenerator {
  static Route routeAll(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(settings, SplashScreenPage());
      case '/intro':
        return _buildRoute(settings, IntroductionPage());
      case '/welcome':
        return _buildRoute(settings, WelcomeScreen());
      case '/sign-in':
        return _buildRoute(settings, SignInPage());
      case '/sign-up':
        return _buildRoute(settings, SignUpPage());
      case '/verification-code':
        return _buildRoute(settings, VerificationCodePage());
      case '/dashboard':
        return _buildRoute(settings, DashboardPage());
      case '/home':
        return _buildRoute(settings, HomePage());
      case '/food-detail':
        return _buildRoute(settings, FoodDetailPage());
      case '/review':
        return _buildRoute(settings, ReviewPage());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Coming soon'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute _buildRouteDialog(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }
}
