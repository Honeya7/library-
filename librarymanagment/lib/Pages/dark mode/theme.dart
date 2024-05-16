import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background:Color.fromARGB(173, 252, 250, 250),
    primary: Colors.white,
    secondary: Colors.black,
              )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
   colorScheme: const ColorScheme.dark(
    background:Color.fromARGB(255, 24, 24, 24),
    primary: Colors.black,
    secondary: Color.fromARGB(255, 255, 254, 254),
              )
);