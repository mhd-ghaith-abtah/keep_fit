import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

/// thin Century-Gothic font style
TextStyle getThinTextStyle({
  double fontSize = 12.0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.thin, color);
}

/// light Century-Gothic font style
TextStyle getLightTextStyle({
  double fontSize = 12.0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

/// regular Century-Gothic font style
TextStyle getRegularTextStyle({
  double fontSize = 12.0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

/// medium Century-Gothic font style
TextStyle getMediumTextStyle({
  double fontSize = 12.0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

/// bold Century-Gothic font style
TextStyle getBoldTextStyle({
  double fontSize = 12.0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
