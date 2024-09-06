import 'package:flutter/material.dart';

import '../constants/global_colors.dart';


class ThemeManager {
  static ThemeData themeData() {
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
      brightness: Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: lightIconsColor,
        brightness: Brightness.light,
      ),
    );  }
}
