import 'package:advanced_flutter_course/presentation/resources/fonts_manager.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle(
  String fontFamily,
  FontWeight fontWeight,
  double fontSize,
  Color color,
) {
  return TextStyle(
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

//* light style
TextStyle lightTextStyleManager({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _textStyle(
    FontFamilyManager.montserrat,
    FontWeightManager.light,
    fontSize,
    color,
  );
}

//* regular style
TextStyle regularTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontFamilyManager.montserrat,
    FontWeightManager.regular,
    fontSize,
    color,
  );
}

//* medium style
TextStyle mediumTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontFamilyManager.montserrat,
    FontWeightManager.medium,
    fontSize,
    color,
  );
}

//* semi-bold style
TextStyle semiBoldTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontFamilyManager.montserrat,
    FontWeightManager.semibold,
    fontSize,
    color,
  );
}

//* bold style
TextStyle boldTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontFamilyManager.montserrat,
    FontWeightManager.bold,
    fontSize,
    color,
  );
}
