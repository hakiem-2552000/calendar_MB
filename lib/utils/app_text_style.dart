import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle disableTextStyle() => TextStyle(
        color: Colors.grey,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );
  static TextStyle defaultTextStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: DEFAULT_TEXT_COLOR,
      );
  static TextStyle linkTextStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.blue,
        decoration: TextDecoration.underline,
      );

  static TextStyle smallTitleTextStyle() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: DARK_BLUE_COLOR,
      );

  static TextStyle titleTextStyle() => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: DARK_BLUE_COLOR,
      );
}
