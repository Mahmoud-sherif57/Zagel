import 'package:flutter/material.dart';
import 'package:zagel/core/utils/colors.dart';

TextStyle getTitleStyle(context,
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle}) {
  return TextStyle(
    fontStyle: fontStyle,

    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.white,
    // color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getBodyStyle(context,
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle}) {
  return TextStyle(
    fontStyle: fontStyle,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.white,
    // color: color ?? Theme.of(context).colorScheme.onSurface
  );
}

TextStyle getSmallStyle(
    {context,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle}) {
  return TextStyle(
    fontStyle: fontStyle,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.grey,
  );
}
