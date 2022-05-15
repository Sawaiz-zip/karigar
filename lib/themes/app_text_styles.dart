import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle textH1(
      {Color textColor = Colors.black,
      FontStyle fontStyle = FontStyle.italic}) {
    return TextStyle(
      fontFamily: 'SF UI Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: 24,
      fontStyle: fontStyle,
      color: textColor,
    );
  }

  static TextStyle textH2(
      {double fontSize = 18, Color textColor = Colors.black}) {
    return textHeading(fontSize, textColor: textColor);
  }

  static TextStyle textH3(
      {double fontSize = 16.0, Color? textColor = Colors.black}) {
    return textHeading(fontSize, textColor: textColor);
  }

  static TextStyle textH3Light({Color textColor = Colors.black}) {
    return textRegular(14, textColor: textColor);
  }

  static TextStyle textH4({Color textColor = Colors.black}) {
    return textBold(14, textColor: textColor);
  }

  static TextStyle textH5({Color? textColor = Colors.black}) {
    return textHeading(12, textColor: textColor);
  }

  static TextStyle textB1(
      {Color textColor = Colors.black, double fontSize = 14}) {
    return textRegular(fontSize, textColor: textColor);
  }

  static TextStyle textB2Font14(
      {Color textColor = Colors.black,
      FontWeight fontWeight = FontWeight.w400}) {
    return textBody(14, textColor: textColor);
  }

  static TextStyle textB2BoldFont14({Color textColor = Colors.black}) {
    return textRegular(14, textColor: textColor);
  }

  static TextStyle textB2(
      {double fontSize = 13, Color textColor = Colors.black}) {
    return textBody(fontSize, textColor: textColor);
  }

  static TextStyle textB3({Color textColor = Colors.black}) {
    return textBody(12, textColor: textColor);
  }

  static TextStyle textBody(double fontSize, {Color textColor = Colors.black}) {
    return _textUIDisplay(fontSize, FontWeight.w400, textColor);
  }

  static TextStyle textBold(double fontSize, {Color textColor = Colors.black}) {
    return _textUIDisplay(fontSize, FontWeight.w600, textColor);
  }

  static TextStyle textHeading(double fontSize,
      {Color? textColor = Colors.black}) {
    return _textUIDisplay(fontSize, FontWeight.w700, textColor);
  }

  static TextStyle textRegular(double fontSize,
      {Color textColor = Colors.black}) {
    return _textUIDisplay(fontSize, FontWeight.w500, textColor);
  }

  static TextStyle _textUIDisplay(
      double fontSize, FontWeight fontWeight, Color? textColor) {
    return TextStyle(
      fontFamily: 'SF UI Display',
      fontWeight: fontWeight,
      letterSpacing: -0.5,
      fontSize: fontSize,
      color: textColor,
    );
  }

  static TextStyle textFenixH({Color textColor = Colors.black}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: 60,
      fontStyle: FontStyle.italic,
      color: textColor,
    );
  }

  static TextStyle textPOEHeader({Color textColor = Colors.black}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: 48,
      fontStyle: FontStyle.italic,
      color: textColor,
    );
  }

  static TextStyle textH0({Color textColor = Colors.black}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: 32,
      color: textColor,
    );
  }

  static TextStyle textH0Italic(
      {Color textColor = Colors.black, double fontSize = 32}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: fontSize,
      fontStyle: FontStyle.italic,
      color: textColor,
    );
  }

  static TextStyle textMax({Color textColor = Colors.black}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: 32,
      color: textColor,
    );
  }

  static TextStyle textH2Font20Bold({Color textColor = Colors.black}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: 20,
      color: textColor,
    );
  }

  static TextStyle textH2Bold({Color textColor = Colors.black}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      fontSize: 18,
      color: textColor,
    );
  }

  // TODO(Devs): Remove the fonts below gradually, and move to the styles above.

  static TextStyle extraBoldStyle(
      {double? fontSize, Color? textColor, double letterSpacing = 1.0}) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        color: textColor,
        letterSpacing: letterSpacing);
  }

  static TextStyle boldStyle(
      {double? fontSize, Color? textColor, double letterSpacing = 1.0}) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: textColor,
        letterSpacing: letterSpacing);
  }

  static TextStyle mediumStyle({double? fontSize, Color? textColor}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: textColor,
    );
  }

  static TextStyle regularStyle({double? fontSize, Color? textColor}) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: textColor,
    );
  }

  static TextStyle welcomeHeading1Montserrat(
      {double fontSize = 32.0, Color? textColor}) {
    return TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        height: 1,
        color: textColor,
        fontStyle: FontStyle.italic);
  }

  static TextStyle welcomeHeading0(Color textColor) {
    return TextStyle(
        fontFamily: 'SF-Pro-Display',
        fontWeight: FontWeight.w900,
        fontSize: 60,
        height: 1,
        color: textColor,
        fontStyle: FontStyle.italic);
  }

  static TextStyle welcomeHeading1({double fontSize = 32.0, Color? textColor}) {
    return TextStyle(
        fontFamily: 'SF-Pro-Display',
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        height: 1,
        color: textColor,
        fontStyle: FontStyle.italic);
  }

  static TextStyle welcomeHeading2(Color textColor) {
    return TextStyle(
      fontFamily: 'SF-Pro-Display',
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: textColor,
    );
  }

  static TextStyle welcomeHeading3(Color textColor) {
    return TextStyle(
      fontFamily: 'SF-Pro-Display',
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: textColor,
    );
  }

  static TextStyle heading1({Color? textColor}) {
    return mediumStyle(fontSize: 32, textColor: textColor);
  }

  static TextStyle heading2({Color? textColor}) {
    return mediumStyle(fontSize: 20, textColor: textColor);
  }

  static TextStyle heading3({Color? textColor}) {
    return mediumStyle(fontSize: 18, textColor: textColor);
  }

  static TextStyle heading4({Color? textColor}) {
    return mediumStyle(fontSize: 16, textColor: textColor);
  }

  static TextStyle text1({Color? textColor}) {
    return regularStyle(fontSize: 16, textColor: textColor);
  }

  static TextStyle text2({Color? textColor}) {
    return regularStyle(fontSize: 14, textColor: textColor);
  }

  static TextStyle text3({Color? textColor}) {
    return regularStyle(fontSize: 12, textColor: textColor);
  }

  static TextStyle linkButton(
      {double? fontSize, Color? textColor, double letterSpacing = 1.0}) {
    return TextStyle(
        fontFamily: 'SF-Pro-Display',
        fontSize: fontSize,
        color: textColor,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline);
  }
}
