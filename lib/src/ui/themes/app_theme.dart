import 'package:flutter/material.dart';

class AppTheme {
  // static Color primaryColor = Color(0xFF283618); // Azul
  // static Color secondaryColor = Color(0xFFbc6c25); // Gris oscuro
  // static Color accentColor = Color(0xFFdda15e); // Blanco
  // static Color backgroundColorLight = Color(0xFFfefae0); // Blanco
  // static Color backgroundColorDark = Color(0xFF606c38); // Negro

  static Color primaryColor = Color(0xff393E41); 
  static Color secondaryColor = Color(0xFF44BBA4);
  static Color accentColor = Color(0xFFE7BB41); 
  static Color backgroundColorLight = Color(0xffE7E5DF);
  static Color backgroundColorDark = Color(0xffD3D0CB);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    useMaterial3: true, // Habilitar Material 3
    appBarTheme: AppBarTheme(
      color: primaryColor,
      titleTextStyle: TextStyle(
        fontSize: 16.0, color: AppTheme.backgroundColorLight)
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: accentColor,
      indicatorColor: primaryColor,
    ),
    scaffoldBackgroundColor: backgroundColorLight,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: accentColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    useMaterial3: true, // Habilitar Material 3
    appBarTheme: AppBarTheme(
      color: secondaryColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: secondaryColor,
      indicatorColor: primaryColor,
    ),
    scaffoldBackgroundColor: backgroundColorDark,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: secondaryColor,
    ),
  );
}