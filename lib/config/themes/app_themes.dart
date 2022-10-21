import 'package:flutter/material.dart';

ThemeData appTheme() {
  Map<int, Color> color = const <int, Color>{
    50: Color.fromRGBO(57, 129, 255, .1),
    100: Color.fromRGBO(57, 129, 255, .2),
    200: Color.fromRGBO(57, 129, 255, .3),
    300: Color.fromRGBO(57, 129, 255, .4),
    400: Color.fromRGBO(57, 129, 255, .5),
    500: Color.fromRGBO(57, 129, 255, .6),
    600: Color.fromRGBO(57, 129, 255, .7),
    700: Color.fromRGBO(57, 129, 255, .8),
    800: Color.fromRGBO(57, 129, 255, .9),
    900: Color.fromRGBO(57, 129, 255, 1),
  };
  MaterialColor primary = MaterialColor(0xff3981ff, color);

  return ThemeData(
    primarySwatch: primary,
    // hintColor: hint,
    //highlightColor: Colors.red,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    textTheme: const TextTheme(
      // button: const TextStyle(
      //   fontSize: 16,
      //   fontFamily: AppStrings.fontFamily,
      //   color: Colors.black,
      //   fontWeight: FontWeight.w500,
      // ),
      bodyMedium: TextStyle(
        height: 1.3,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
