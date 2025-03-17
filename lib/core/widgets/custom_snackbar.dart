import 'package:flutter/material.dart';
import 'package:zagel/core/utils/colors.dart';

customSnackBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.red,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Text(text),
    ),
  );
}
