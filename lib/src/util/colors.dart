import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  static const redMedium = const Color(0xfff54b64);
  static const tanHide = const Color(0xFFFE724C);
  static const greyBlack = const Color(0xFFFFFFFF);
  static const greenBlack = const Color(0xFF00BC63);
  static const bgTextField = const Color(0xff393948);
  static const slate = const Color(0xff4e586e);
  static const dark = const Color(0xff2D2D3A);
  static const deepSkyBlue = const Color(0xff007aff);
  static const black60 = const Color(0x99000000);
  static const veryLightPink = const Color(0xfff3f3f3);
  static const white92 = const Color(0xebffffff);
  static const orangeRed = const Color(0xffff3b30);
  static const paleGrey = const Color(0xffefeff4);
  static const lightBlueGrey = const Color(0xffd1d1d6);
  static const warmBlue = const Color(0xff5856d6);
  static const black = const Color(0xff1d1d26);
  static const paleLilac = const Color(0xffe5e5ea);
  static const robinSEgg = const Color(0xff5ac8fa);
  static const weirdGreen = const Color(0xff4cd964);
  static const white = const Color(0xffffffff);
  static const tangerine = const Color(0xffff9500);
  static const marigold = const Color(0xffffcc00);
  static const black30 = const Color(0x4d000000);
  static const softBlue = const Color(0xff5aacff);
  static const grey100 = const Color(0xfff5f5f5);
  static const grey200 = const Color(0xffeeeeee);
  static const blur = const Color.fromARGB(75, 255, 255, 255);
  static const blurWhite = const Color.fromRGBO(255, 255, 255, 0.3);
  static const transparent = const Color.fromARGB(10, 255, 255, 255);
  static const darkGray = const Color(0xFF2A2E3A);
  static const MediumGray = const Color(0xFF707070);
  static const blackRussian = const Color(0xFF20242F);
  static const text_login = const Color(0xffff2d55);
  static const blackOpa50 = const Color.fromRGBO(0, 0, 0, 0.5);
  static const redGoogle = const Color(0xffd93025);
  static const orangeHoang = const Color(0xfff25831);
  static const redMedium_tanHide_gradient =
      LinearGradient(colors: [redMedium, tanHide]);
  static const gradient_tanHide_redMedium = LinearGradient(
      colors: [weirdGreen, greenBlack],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const gradient_black_to_grey = LinearGradient(
      colors: [Colors.transparent, MyColors.black60],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const orangeLight = const Color(0xffF78361);
  static const grey = const Color(0xff616770);
}
