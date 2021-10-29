import 'package:flutter/material.dart';

class TrottersColors {
  static final TrottersColors _trotterColors = TrottersColors._();

  factory TrottersColors(){
    return _trotterColors;
  }

  TrottersColors._();

  //blue
  final Color blue = Colors.blue.shade600;
  final Color lightBlue = Colors.blue.shade100;
  final Color darkBlue = Colors.blue.shade900;

//grey
  final Color lightgrey = Color.fromRGBO(245, 245, 245, 1);
  final Color greyUltraLight = Color.fromRGBO(229, 229, 229, 1);
  final Color greyMedium = Color.fromRGBO(203, 203, 203, 1);
  final Color lighttext = Colors.grey.shade400;
  final Color grey = Colors.grey.shade600;
  final Color darkGrey = Colors.grey.shade900;
  final Color black = Colors.black;

  final Color green = Color.fromRGBO(67, 177, 122, 1);
  final Color greenWithOpactiy20 = Color.fromRGBO(105,193,149,1);
  final Color lightGreen = Color.fromRGBO(208, 241, 224, 1);
  final Color pink = Color.fromRGBO(251, 233, 215, 1.0);
  final Color white = Colors.white;
  final Color yellow = Color.fromRGBO(241, 223, 124, 1);
}

