import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/uidata.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      navigateToNewScreen('/verification-code');
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: MyColors.tanHide,
      body: Center(child: _logoApp()),
    );
  }

  Widget _logoApp() {
    return Image.asset(UIData.logoApp);
  }

  navigateToNewScreen(String routeName, {dynamic argument}) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed(routeName, arguments: argument);
  }
}
