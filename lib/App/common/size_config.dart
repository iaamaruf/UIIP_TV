import 'package:flutter/material.dart';

class SizeConfig{
  static double _screenWidth=0;
  static double _screenHeight=0;

  static double screenHeight=0;
  static double screenWidth=0;

  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;

    }

    screenHeight = _screenHeight;
    screenWidth = _screenWidth;

  }
}