import 'package:flutter/material.dart';

import '../constants/global_colors.dart';

class ThemeManager {
  static ThemeData themeData({required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: lightScaffoldColor,
      primaryColor: lightCardColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: lightIconsColor,
        ),
        backgroundColor: lightScaffoldColor,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: lightTextColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: lightIconsColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.blue,
        // selectionHandleColor: Colors.blue,
      ),
      // textTheme: TextTheme()
      // textTheme: Theme.of(context).textTheme.apply(
      //       bodyColor: Colors.black,
      //       displayColor: Colors.black,
      //     ),
      cardColor: lightCardColor,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Theme.of(context).cardColor,
        filled: true,
        suffixIconColor: lightIconsColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Theme.of(context).cardColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 1 ,
            color: Theme.of(context).colorScheme.secondary,
          ),
        )
      ),
      brightness: Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: lightIconsColor,
            brightness: Brightness.light,
          ),
    );
  }
}
