import 'package:flutter/material.dart';
import 'package:foodhub/src/module/dashboard/page/dashboard_page.dart';
import 'package:foodhub/src/module/home/pages/home_page.dart';
import 'package:foodhub/src/module/login/page/introduction_page.dart';
import 'package:foodhub/src/module/login/page/sign_in_page.dart';
import 'package:foodhub/src/module/login/page/welcome_page.dart';

class RouteGenerator {
  static Route routeAll(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(settings, WelcomeScreen());
      case '/intro':
        return _buildRoute(settings, IntroductionPage());
      case '/sign-in':
        return _buildRoute(settings, SignInPage());
      case '/dashboard':
        return _buildRoute(settings, DashboardPage());
      case '/home':
        return _buildRoute(settings, HomePage());
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
