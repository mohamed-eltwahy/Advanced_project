import 'fonts.dart';
import 'package:flutter/cupertino.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontsManager.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeight.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeight.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeight.light, color);
}

// bold style

TextStyle getBoldtStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeight.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeight.semiBold, color);
}
