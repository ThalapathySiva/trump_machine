import 'package:flutter/material.dart';

class TrumpTheme {
  ThemeData darkTheme = ThemeData();

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(body1: TextStyle(color: Colors.black54)),
    scaffoldBackgroundColor: Colors.grey[50],
    iconTheme: IconThemeData(
      color: secondaryTrumpColor,
    ),
    primarySwatch: primaryTrumpColor,
    accentColor: secondaryTrumpColor,
  );

  ThemeData buildThemeData({@required bool isDark}) {
    if (isDark) {
      return lightTheme;
    } else {
      return lightTheme;
    }
  }

  TrumpTheme();
}

//Define Material Primary Color
MaterialColor primaryTrumpColor = MaterialColor(0xFF1a3263, primaryTrumpSwatch);
//Define Material Primary Swatch
final Map<int, Color> primaryTrumpSwatch = {
  50: Color.fromRGBO(26, 50, 99, 0.1),
  100: Color.fromRGBO(26, 50, 99, 0.2),
  200: Color.fromRGBO(26, 50, 99, 0.3),
  300: Color.fromRGBO(26, 50, 99, 0.4),
  400: Color.fromRGBO(26, 50, 99, 0.5),
  500: Color.fromRGBO(26, 50, 99, 0.6),
  600: Color.fromRGBO(26, 50, 99, 0.7),
  700: Color.fromRGBO(26, 50, 99, 0.8),
  800: Color.fromRGBO(26, 50, 99, 0.9),
  900: Color.fromRGBO(26, 50, 99, 1),
};
//Define Material Secondary Color
MaterialColor secondaryTrumpColor =
    MaterialColor(0xFFFAB95B, secdondaryTrumpSwatch);
//Define Material Secondary Color
final Map<int, Color> secdondaryTrumpSwatch = {
  50: Color.fromRGBO(250, 185, 91, 0.1),
  100: Color.fromRGBO(250, 185, 91, 0.2),
  200: Color.fromRGBO(250, 185, 91, 0.3),
  300: Color.fromRGBO(250, 185, 91, 0.4),
  400: Color.fromRGBO(250, 185, 91, 0.5),
  500: Color.fromRGBO(250, 185, 91, 0.6),
  600: Color.fromRGBO(250, 185, 91, 0.7),
  700: Color.fromRGBO(250, 185, 91, 0.8),
  800: Color.fromRGBO(250, 185, 91, 0.9),
  900: Color.fromRGBO(250, 185, 91, 1),
};

//Define Material Tirtiary Color

MaterialColor tirtiaryTrumpColor =
    MaterialColor(0xFFf16821, tirtiaryTrumpSwatch);

//Define Material Tirtiary Swatch
final Map<int, Color> tirtiaryTrumpSwatch = {
  50: Color.fromRGBO(241, 104, 33, 0.1),
  100: Color.fromRGBO(241, 104, 33, 0.2),
  200: Color.fromRGBO(241, 104, 33, 0.3),
  300: Color.fromRGBO(241, 104, 33, 0.4),
  400: Color.fromRGBO(241, 104, 33, 0.5),
  500: Color.fromRGBO(241, 104, 33, 0.6),
  600: Color.fromRGBO(241, 104, 33, 0.7),
  700: Color.fromRGBO(241, 104, 33, 0.8),
  800: Color.fromRGBO(241, 104, 33, 0.9),
  900: Color.fromRGBO(241, 104, 33, 1),
};
