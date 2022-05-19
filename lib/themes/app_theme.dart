import 'package:flutter/material.dart';


class AppTheme {
  static const Color primary = Colors.deepPurple;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Color primario
    primaryColor: primary,
    //AppBar theme
    appBarTheme: const AppBarTheme(
      color: primary,
      centerTitle: true,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary),
    ),

    //FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0,
    )
    
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //Color primario
    primaryColor: primary,
    //AppBar theme
    appBarTheme: const AppBarTheme(
      color: primary,
      centerTitle: true,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary),
    ),

    //FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0,
    ),
  );
}