import 'dart:math';
import 'package:flutter/material.dart';

bool isPad(BuildContext context) {
  var query = MediaQuery.of(context);
  var size = query.size;
  var diagonal = sqrt((size.width * size.width) + (size.height * size.height));

  return (diagonal > 1100.0);
}

dynamic getSize(double px, BuildContext context) {
  return isPad(context)
      ? px * ((MathUtilities.screenWidth(context)) / 667)
      : px * ((MathUtilities.screenWidth(context)) / 414);
}

dynamic getFontSize(double px, BuildContext context) {
  return isPad(context)
      ? px * ((MathUtilities.screenWidth(context)) / 667)
      : px * ((MathUtilities.screenWidth(context)) / 414);
}

dynamic getPercentageWidth(double percentage, BuildContext context) {
  return MathUtilities.screenWidth(context) * percentage / 100;
}

class MathUtilities {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static screenWidthDensity(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static safeAreaTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static safeAreaBottomHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}
