import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/text_data.dart';
import 'package:foodhub/src/widgets/stateful/filled_round_button.dart';

class SignInWith extends StatelessWidget {
  const SignInWith({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLineTextLine(),
        Row(
          children: [
            Expanded(child: _buildButtonLoginWithFacebook()),
            SizedBox(
              width: 10,
            ),
            Expanded(child: _buildButtonLoginWithGmail()),
          ],
        ),
      ],
    );
  }

  Widget _buildLineTextLine() {
    return Container(
      child: Row(children: <Widget>[
        Expanded(
          child: Container(
              margin: EdgeInsets.only(left: 10, right: 10.0),
              child: Divider(
                color: Colors.white,
                height: 50,
              )),
        ),
        Text(
          "sign in with",
          style: TextStyle(
              color: Colors.white, fontStyle: FontStyle.normal, fontSize: 14.0),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10),
              child: Divider(
                color: Colors.white,
                height: 50,
              )),
        ),
      ]),
    );
  }

  Widget _buildButtonLoginWithFacebook() {
    return Container(
      height: 50.0,
      child: FilledRoundButton.withColor(
        pureColor: MyColors.deepSkyBlue,
        text: Text(TextData.signInWithFB, style: StylesText.largeTitle),
        onTap: () {},
      ),
    );
  }

  Widget _buildButtonLoginWithGmail() {
    return Container(
      height: 50.0,
      child: FilledRoundButton.withColor(
        pureColor: MyColors.orangeRed,
        text: Text(TextData.signInWithGG, style: StylesText.largeTitle),
        onTap: () {},
      ),
    );
  }
}
