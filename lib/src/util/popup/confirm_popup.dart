import 'package:flutter/cupertino.dart';

class ConfirmPopup extends StatelessWidget {
  final String content;
  final String confirmText;
  final String cancelText;
  final String confirmTitle;

  const ConfirmPopup({
    this.content,
    this.confirmText,
    this.cancelText,
    this.confirmTitle,
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
        CupertinoDialogAction(
          child: Text("Trở về"),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        CupertinoDialogAction(
          child: Text("Xác nhận"),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}
