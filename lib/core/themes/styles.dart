import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  focusColor: Colors.black,
  backgroundColor: Colors.white,
  primaryColor: Color.fromARGB(213, 225, 0, 67),
  hintColor: Color.fromARGB(255, 179, 179, 179),
  bottomAppBarColor: Color.fromARGB(255, 80, 78, 78),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white)),
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline1: TextStyle(),
    subtitle1: TextStyle(color: Color.fromARGB(255, 94, 92, 92)),
    subtitle2: TextStyle(color: Color.fromARGB(255, 141, 139, 139)),
    headline6: TextStyle(),
    bodyText2: TextStyle(),
    caption: TextStyle(color: Color.fromARGB(255, 148, 139, 139)),
  ),
);
final ThemeData darkTheme = ThemeData(
  fontFamily: 'Poppins',
  focusColor: Colors.white,
  bottomAppBarColor: Color.fromARGB(255, 177, 72, 72),
  scaffoldBackgroundColor: Color.fromARGB(255, 65, 59, 59),
  backgroundColor: Color.fromARGB(255, 65, 59, 59),
  primaryColor: Color.fromARGB(255, 255, 105, 105),
  hintColor: Colors.white,
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline1: TextStyle(),
    subtitle1: TextStyle(color:  Colors.white),
    subtitle2: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    bodyText2: TextStyle(),
    caption: TextStyle(color: Colors.white),
  ),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
