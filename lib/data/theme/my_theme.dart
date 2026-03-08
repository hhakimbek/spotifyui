import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF121212),
    textTheme: ThemeData.dark().textTheme.copyWith(
      titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
    ),
    sliderTheme: SliderThemeData(
      tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 1.0,),
      trackHeight: 3,
    ),

    colorScheme: ColorScheme.dark(
      primary: Color(0xFF121212), //back
      onPrimary: Color(0xFF1ED760),
      tertiary: Color(0xFF1F1F1F), //drawer
      secondary: Color(0xFF292929), //grey button, containerlar uchun
      surfaceDim: Color(0xFF808080), //border
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color(0xFFB3B3B3),
      selectedItemColor: Colors.white,
      backgroundColor: Colors.transparent,
      selectedLabelStyle: TextStyle(fontSize: 12),
    ),
  );
}
