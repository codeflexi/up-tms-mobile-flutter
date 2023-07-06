import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/utils/theme/widget_thems/elevated_button_theme.dart';
import 'package:flutter_ws_1/src/utils/theme/widget_thems/outlined_button_theme.dart';
import 'package:flutter_ws_1/src/utils/theme/widget_thems/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Up',
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      primarySwatch: Colors.red
      // primarySwatch: MaterialColor(0xFFFFE200, <int, Color>{
      //   50: Color.fromRGBO(143, 101, 99, 1),
      //   100: Color.fromRGBO(255, 13, 0, 0.844),
      //   200: Color.fromRGBO(255, 13, 0, 1),
      //   300: Color.fromRGBO(255, 13, 0, 1),
      //   400: Color.fromRGBO(255, 13, 0, 1),
      //   500: Color.fromRGBO(255, 13, 0, 1),
      //   600: Color.fromRGBO(255, 13, 0, 1),
      //   700: Color.fromRGBO(255, 13, 0, 1),
      //   800: Color.fromRGBO(255, 13, 0, 1),
      //   900: Color.fromRGBO(255, 13, 0, 1),
      // }),
      
      );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Up',
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    //primarySwatch: Colors.red
  );
}
