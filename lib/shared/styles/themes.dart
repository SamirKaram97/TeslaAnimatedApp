import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
  );
}
