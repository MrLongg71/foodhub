import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'uidata.dart';

class ProgressDialog extends StatefulWidget {
 late final ProgressDialogState progressDialogState;

  //@override
  // ProgressDialogState createState() => ProgressDialogState();

  @override
  createState() => progressDialogState = ProgressDialogState();

  void hideProgress() {
    progressDialogState.hideProgress();
  }

  void showProgress() {
    progressDialogState.showProgress();
  }
}

class ProgressDialogState extends State<ProgressDialog> {
  bool _opacity = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !_opacity ? null : LoadingApp(),
    );
  }

  void hideProgress() {
    setState(() {
      _opacity = false;
    });
  }

  void showProgress() {
    setState(() {
      _opacity = true;
    });
  }

  bool isShowProgress() {
    return _opacity;
  }
}

class LoadingApp extends StatelessWidget {
  const LoadingApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      child: Center(
        child: AvatarGlow(
          endRadius: 100,
          duration: const Duration(seconds: 2),
          repeat: true,
          repeatPauseDuration: const Duration(seconds: 1),
          child: Material(
            elevation: 1.0,
            shape: CircleBorder(),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(120.0),
              ),
              child: Image.asset(
                UIData.logoApp,
                height: 180,
                width: 180,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
