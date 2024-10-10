import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xff161616);
  static const Color darkGrey = Color(0xff252525);
  static const Color grey = Color(0xff666666);
  static const Color grey60 = Color.fromARGB(60, 102, 102, 102);
  static const Color white = Color(0xfffdfdfd);
  static const Color white150 = Color.fromARGB(150, 253, 253, 253);
  static const Color brightBlue = Color(0xff007aff);
  static const Color darkBlue = Color(0xff0079b2);
  static const Color lightBlue = Color(0xff80d6ff);
  static const Color lightBlue90 = Color.fromARGB(90, 128, 215, 255);
  static const Color red = Color(0xfff04235);

  static Map<String, Color> darkScheme = {
    'primary': brightBlue,
    'secondary': lightBlue,
    'neutral': grey,
    'neutral2': darkGrey,
    'text': white,
    'back': black,
  };
  static Map<String, Color> lightScheme = {
    'primary': brightBlue,
    'secondary': lightBlue,
    'neutral': grey,
    'neutral2': darkGrey,
    'text': black,
    'back': white,
  };
  static Map<String, Map<String, Color>> schemes = {
    'Dark': darkScheme,
    'Light': lightScheme,
    'System': darkScheme,
  };
}
