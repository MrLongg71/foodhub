import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/src/util/alert_progress.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/popup/error_popup.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/text_data.dart';
import 'package:foodhub/src/util/uidata.dart';
import 'package:foodhub/src/widgets/stateful/filled_round_button.dart';
import 'package:foodhub/src/widgets/stateless/sign_in_with.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeForm();
    // return BlocProvider(
    //   create: (ctx) => LoginBloc(userRepository: UserRepository()),
    //   child: WelcomeForm(),
    // );
  }
}

class WelcomeForm extends StatefulWidget {
  @override
  _WelcomeFormState createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  Size _size;
  Widget loadingWidget;
  bool showBtnGmail = true;
  bool isDarkMode = false;

  ProgressDialog progressDialog = ProgressDialog();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      // body: BlocListener<LoginBloc, LoginState>(
      //   listener: (context, state) {
      //     if (state is LoadingState) {
      //       progressDialog.showProgress();
      //     } else if (state is ValidPhoneState) {
      //       progressDialog.hideProgress();
      //       _switchAuthUser(state?.type, user: state?.user);
      //     } else if (state is LoginSuccessState) {
      //       BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
      //     }
      //   },
      //   child: BlocBuilder<LoginBloc, LoginState>(
      //     builder: (ctx, state) {
      //       return _buildBody();
      //     },
      //   ),
      // ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: <Widget>[
          Image.asset(
            UIData.backgroundWelcomeScreen,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            decoration:
                BoxDecoration(gradient: MyColors.gradient_black_to_grey),
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildWelcomeText(),
                Column(
                  children: [
                    SignInWith(),
                    _buildButtonLogin(),
                    _buildTextSignIn()
                  ],
                ),
              ],
            ),
          ),
          progressDialog
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return RichText(
      text: TextSpan(
        text: 'Welcome to \n',
        style: StylesText.body50BlackWelcome,
        children: <TextSpan>[
          TextSpan(text: 'Food Hub \n', style: StylesText.body33OrangeWelcome),
          TextSpan(
              text: 'Your favourite foods delivered \n fast at your door.',
              style: StylesText.body13BlackWelcome),
        ],
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 50.0,
      child: FilledRoundButton.withColor(
        pureColor: Colors.white54,
        text: Text(
          TextData.buttonSignIn,
          style: Theme.of(context)
              .textTheme
              .headline
              .merge(TextStyle(color: Colors.white)),
        ),
        onTap: () => navigateToNewScreen('/sign-in'),
      ),
    );
  }

  Widget _buildTextSignIn() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: RichText(
          text: TextSpan(
        text: 'Already have an account? ',
        style: StylesText.body14RegularWhite,
        children: <TextSpan>[
          TextSpan(
              text: 'Sign in',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontFamily: "SFProText",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0)),
        ],
      )),
    );
  }

  void _loginWithFB() async {}

  void _loginWithGmail() async {}

  void _showErrorMessage(String content) => showDialog(
      context: context,
      builder: (ctx) => ErrorPopup(
            content,
          ));

  navigateToNewScreen(String routeName, {dynamic argument}) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed(routeName, arguments: argument);
  }
}
