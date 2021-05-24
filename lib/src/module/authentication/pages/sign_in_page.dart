import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';
import 'package:foodhub/src/widgets/stateful/filled_round_button.dart';
import 'package:foodhub/src/widgets/stateless/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: StylesText.body30RegularSFProText,
                ),
                CustomTextField(
                  hintText: "Your email",
                  titleText: "E-mail",
                  borderColor: MyColors.bgTextField,
                  backgroundColor: MyColors.bgTextField,
                  hasBorder: true,
                ),
                CustomTextField(
                  hintText: "Password",
                  titleText: "Password",
                  backgroundColor: MyColors.bgTextField,
                  borderColor: MyColors.bgTextField,
                  hasBorder: true,
                ),
                _buildTextForgotPassword(),
                _buildButtonLogin(),
                _buildTextSignUp(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Forgot password?",
        style: TextStyle(color: Color(0xffffADADB8)),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 30, right: 30),
      width: double.infinity,
      height: 50.0,
      child: FilledRoundButton.withColor(
        radius: 28,
        pureColor: MyColors.tanHide,
        text: Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .headline
              .merge(TextStyle(color: Colors.white)),
        ),
        onTap: () {
          navigateToNewScreen('/dashboard');
        },
      ),
    );
  }

  Widget _buildTextSignUp() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'Don have an account? ',
          style: StylesText.body14RegularWhite,
          children: <TextSpan>[
            TextSpan(
                text: 'Sign up',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColors.tanHide,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    fontSize: 14.0),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => navigateToNewScreen('/sign-up')),
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
