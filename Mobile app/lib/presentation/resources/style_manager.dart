import 'package:flutter/material.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, String fontFamily, Color color) {
  return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.regular, FontConstant.fontFamily, color
  );
}
// Text light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.light, FontConstant.fontFamily, color
  );
}
// Text style bold
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.bold, FontConstant.fontFamily, color
  );
}

// Text style semi bold
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.semiBold, FontConstant.fontFamily, color
  );
}
// Text style medium
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.medium, FontConstant.fontFamily, color
  );
}

