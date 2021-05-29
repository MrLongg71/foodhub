import 'package:flutter/cupertino.dart';

class ErrorPopup extends StatelessWidget {
  final String content;
  final String confirmText;
  final Function()? onOk;
  final String title;

  const ErrorPopup(
    this.content, {
    this.confirmText = "OK",
    this.onOk,
    this.title = "notification",
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text("Thông báo"),
      ),
      content: Text(content),
      actions: <Widget>[
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
              onOk!();
          },
          child: Text("OK"),
        )
      ],
    );
  }
}
