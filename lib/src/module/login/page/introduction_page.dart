import 'package:flutter/material.dart';
import 'package:foodhub/src/util/uidata.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    //_scale = 1 - _controller.value;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIData.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: paddingTop,
                ),
               // _logoApp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _logoApp() {
  //   return AvatarGlow(
  //     endRadius: 120,
  //     duration: const Duration(seconds: 2),
  //     repeat: true,
  //     repeatPauseDuration: const Duration(seconds: 1),
  //     child: Material(
  //       elevation: 1.0,
  //       shape: CircleBorder(),
  //       child: Container(
  //         height: 180,
  //         width: 180,
  //         decoration: BoxDecoration(
  //           color: Colors.green,
  //           borderRadius: BorderRadius.circular(120.0),
  //         ),
  //         child: Image.asset(
  //           UIData.logoApp,
  //           height: 180,
  //           width: 180,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
