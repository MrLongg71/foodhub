import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({Key key}) : super(key: key);

  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  double _paddingTop;

  @override
  Widget build(BuildContext context) {
    _paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(UIData.ic_1),
          Image.asset(UIData.ic_2),
          Positioned(
            right: 0,
            child: Image.asset(UIData.ic_3),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 20, right: 20, top: _paddingTop + 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification Code",
                  style: StylesText.body30RegularSFProText,
                ),
                _buildTextDesc(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTextFieldCode(),
                    _buildTextFieldCode(),
                    _buildTextFieldCode(),
                    _buildTextFieldCode(),
                  ],
                ),
                _buildTextResend(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextFieldCode() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      child: TextField(
        showCursor: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.bgTextField,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildTextDesc() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        "Please type the verification code sent to 0392350814",
        style: TextStyle(color: Color(0xffffADADB8)),
      ),
    );
  }

  Widget _buildTextResend() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'I dont receive a code? ',
          style: StylesText.body14RegularWhite,
          children: <TextSpan>[
            TextSpan(
                text: 'Pleased resend',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColors.tanHide,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    fontSize: 14.0),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => navigateToNewScreen('/sign-in')),
          ],
        ),
      ),
    );
  }

  navigateToNewScreen(String routeName, {dynamic argument}) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed(routeName, arguments: argument);
  }
}
