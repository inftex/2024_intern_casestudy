import 'package:flutter/material.dart';

const Color deepYellow = Color(0xFFFFD700);

ThemeData appTheme = ThemeData(
  primaryColor: deepYellow,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.amber,
  ).copyWith(
    secondary: deepYellow,
  ),
);
