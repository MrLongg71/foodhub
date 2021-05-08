import 'package:flutter/material.dart';
import 'package:foodhub/src/util/styles.dart';

import 'colors.dart';

enum MyThemeMode { Light, Dark }

class Themes {
  static TextTheme _primaryTextTheme = TextTheme(
    subhead: StylesText.body15CenterRegularSFProText,
    headline: StylesText.body17LeftRegularWhite,
    body1: StylesText.body13SemiBold.merge(TextStyle(color: Colors.white)),
  );

  static TextTheme _accentTextTheme = TextTheme(
    headline: StylesText.body17LeftRegularWhite.merge(
      TextStyle(color: LightColors.accentColor),
    ),
    body1: StylesText.body13SemiBold.merge(
      TextStyle(color: LightColors.accentColor),
    ),
    subhead: StylesText.body15CenterRegularSFProText.merge(
      TextStyle(color: LightColors.accentColor),
    ),
  );

  static ThemeData kLightTheme = ThemeData(
    accentColorBrightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: LightColors.primaryColor,
    accentColor: LightColors.accentColor,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    canvasColor: LightColors.primaryColor,
    dividerColor: const Color(0xff616770),
    iconTheme: IconThemeData(size: 24, color: Colors.white),
    scaffoldBackgroundColor: LightColors.bgColor,
    backgroundColor: LightColors.primaryColor,
    cardTheme: CardTheme(),
    cursorColor: Colors.white,
    // background color of text field
    secondaryHeaderColor: LightColors.bgColor,
    fontFamily: 'SFProText',
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        body1: StylesText.body13SemiWhiteBold,
      ),
      elevation: 1,
      iconTheme: IconThemeData(size: 24, color: Colors.white),
    ),
    textTheme: TextTheme(
        body1: StylesText.body13SemiBold,
        caption: StylesText.tagLine13SemiBold,
        subhead: StylesText.body15CenterRegularSFProText,
        display1: StylesText.body22RegularSFProText.merge(
          TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        display2: StylesText.body14RegularWhite,
        display3: TextStyle(
          fontSize: 12,
          color: const Color(0xff616770),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        ),
        // d
        display4: TextStyle(
          fontSize: 12,
          color: Color(0xff616770).withOpacity(0.68),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        // display info item
        body2: StylesText.caption13CenterRegularWhite.merge(
          TextStyle(color: Colors.white),
        ),
        headline: StylesText.body17LeftRegularWhite.merge(
          TextStyle(color: Colors.white),
        ),
        subtitle: StylesText.tagLine11SemiBold,
        //display username in user profile
        title: StylesText.body15LightSemiBoldWhite
            .merge(TextStyle(color: const Color(0xff616770)))),
    primaryTextTheme: _primaryTextTheme,
    accentTextTheme: _accentTextTheme,
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: StylesText.titleUnSelectedLabel,
      labelStyle: StylesText.body13SemiBold.merge(TextStyle(fontSize: 20)),
      unselectedLabelColor: Colors.black45,
      labelColor: Colors.white,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: MyColors.white,
      contentTextStyle: StylesText.subtitle14RegularTanHide,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
    ),
  );

  static ThemeData kDarkTheme = ThemeData(
    accentColorBrightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: DarkColors.darkColor,
    accentColor: DarkColors.accentColor,
    brightness: Brightness.dark,
    platform: TargetPlatform.iOS,
    canvasColor: DarkColors.primaryColor,
    backgroundColor: DarkColors.primaryColor,
    primarySwatch: Colors.red,
    dividerColor: MyColors.slate,
    iconTheme: IconThemeData(size: 24, color: Colors.red),
    cursorColor: Colors.white,
    // background color of text field
    secondaryHeaderColor: Color(0xff485164),
    cardTheme: CardTheme(
      color: DarkColors.darkColor,
    ),
    fontFamily: 'SFProText',
    appBarTheme: AppBarTheme(
      elevation: 1,
      textTheme: TextTheme(
          headline6: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 28.0,
      )),
    ),
    textTheme: TextTheme(
      body1: StylesText.body13SemiBold,
      caption: StylesText.tagLine13SemiBold,
      subhead: StylesText.body15CenterRegularSFProText,
      display1: StylesText.body22RegularSFProText.merge(
        TextStyle(color: Colors.white.withOpacity(0.7)),
      ),
      display2: StylesText.body14RegularWhite,
      // Display name user in user profile'
      display3: TextStyle(
        fontSize: 12,
        color: Color(0xFFFFFF).withOpacity(0.68),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
      // display bio
      display4: TextStyle(
        fontSize: 12,
        color: Color(0xFFFFFF).withOpacity(0.68),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      // display info item
      headline: StylesText.body17LeftRegularWhite.merge(
        TextStyle(color: Colors.white),
      ),
      subtitle: StylesText.tagLine11SemiBold,
      //display username in user profile
      title: StylesText.body15LightSemiBoldWhite,
    ),
    primaryTextTheme: _primaryTextTheme,
    accentTextTheme: _accentTextTheme,
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: StylesText.titleUnSelectedLabel,
      labelStyle: StylesText.body13SemiBold.merge(TextStyle(fontSize: 20)),
      unselectedLabelColor: MyColors.slate,
      labelColor: MyColors.white,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: MyColors.dark,
      contentTextStyle: StylesText.subtitle14RegularTanHide,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
    ),
  );
}

class LightColors {
  static const primaryColor = const Color(0xFF00BC63);
  static const accentColor = MyColors.orangeLight;
  static const bgColor = Color.fromRGBO(240, 240, 240, 1.0);
}

class DarkColors {
  static const primaryColor = const Color(0xff20242F);

//  static const accentColor = const Color(0xffF54B64);
  static const accentColor = MyColors.orangeLight;
  static const blackColor = const Color(0xff1d1d26);
  static const darkColor = const Color(0xff242a37);
}
