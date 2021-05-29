import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  double? paddingTop;
  PageController? pageIntroController;

  @override
  void initState() {
    super.initState();
    pageIntroController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: PageView(
      controller: pageIntroController,
      children: [
        _buildIntro(
            UIData.ic_intro_1,
            "Browse your menu \n and order directly",
            " Our app can send you everywhere, even \n space. For only 2.99 per month",
            () => pageIntroController?.animateToPage(1,
                duration: Duration(milliseconds: 500), curve: Curves.linear)),
        _buildIntro(
            UIData.ic_intro_2,
            "Even to space \n with us! Together",
            " Our app can send you everywhere, even \n space. For only 2.99 per month",
            () => pageIntroController?.animateToPage(2,
                duration: Duration(milliseconds: 500), curve: Curves.linear)),
        _buildIntro(
            UIData.ic_intro_3,
            "Pickup delivery \n at your door",
            " Our app can send you everywhere, even \n space. For only 2.99 per month",
            () => navigateToNewScreen('/welcome')),
      ],
    ));
  }

  Widget _buildIntro(
      String image, String title, String desc, GestureTapCallback onTap) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop ?? 0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: StylesText.body30RegularSFProText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  desc,
                  style: StylesText.body14RegularWhite,
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: MyColors.tanHide),
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigateToNewScreen(String routeName, {dynamic argument}) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed(routeName, arguments: argument);
  }
}
