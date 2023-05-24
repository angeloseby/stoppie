import 'package:flutter/material.dart';

class ColorPallete {
  static const scaffoldColor = Color(0XFF202020);
  static const titleColor = Color(0xFFFFFFFF);
  static const innerCircleColor = Color(0XFF202020);
  static final outerCircleColor = [
    const Color(0xFFFF9900).withOpacity(0),
    const Color(0xFFF5BF00).withOpacity(1),
    const Color(0xFFFE7A00).withOpacity(1),
    const Color(0xFFFF5C00).withOpacity(1),
  ];
  static const timerColor = Color(0xFFFFFFFF);
  static const flagColor = Color(0xFFFFFFFF);
  static const buttonColor = Color(0XFF202020);
  static const buttonTextColor = Color(0XFFFFFFFF);
}

class FontPallete {
  static const titleTextStyle = TextStyle(
    fontFamily: 'SFProText',
    fontWeight: FontWeight.w100,
    fontSize: 24,
    color: ColorPallete.titleColor,
  );

  static const timerTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.w400,
    fontSize: 28,
    color: ColorPallete.timerColor,
  );

  static const flagTextStyle = TextStyle(
    fontFamily: 'SFProText',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorPallete.flagColor,
  );

  static const buttonTextStyle = TextStyle(
      fontFamily: 'SFProText',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: ColorPallete.buttonTextColor);
}
