import 'package:flutter/material.dart';
import 'package:trotters_flutter_app/utils/colors.dart';

final TrottersColors tc = TrottersColors();

final ThemeData appTheme = ThemeData(

  accentColor: tc.green,
  textTheme: textTheme,
);

final TextTheme textTheme = TextTheme(
  headline2: TextStyle(color: tc.green, fontSize: 32, fontWeight: FontWeight.bold),
  bodyText1: TextStyle(color: tc.lighttext, fontSize: 14),
  headline1: TextStyle(color: tc.green, fontSize: 18, fontWeight: FontWeight.bold),
);