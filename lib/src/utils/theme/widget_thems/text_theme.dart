
import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/constants/colors.dart';


class TTextTheme {

  TTextTheme._();

static TextTheme lightTextTheme = const TextTheme(
 
headline1: TextStyle(fontSize: 28.0 ,color: tDarkColor, fontWeight: FontWeight.bold),
headline2: TextStyle(fontSize: 26.0 ,color: tDarkColor, fontWeight: FontWeight.w700),
headline3: TextStyle(fontSize: 24.0 ,color: tDarkColor, fontWeight: FontWeight.w700),
headline4: TextStyle(fontSize: 16.0 ,color: tDarkColor, fontWeight: FontWeight.w600),
headline6: TextStyle(fontSize: 14.0 ,color: tDarkColor, fontWeight: FontWeight.w600),
subtitle1: TextStyle(fontSize: 16.0,color: Colors.black45 ,fontWeight: FontWeight.bold),
bodyText1: TextStyle(fontSize: 14.0,color: tDarkColor ,fontWeight: FontWeight.normal ),
bodyText2: TextStyle(fontSize: 12.0,color: tDarkColor ,fontWeight: FontWeight.normal ),
    //  displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
    //   bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
 
);

static TextTheme darkTextTheme = const TextTheme(
headline1: TextStyle(fontSize: 28.0 ,color: tWhiteColor, fontWeight: FontWeight.bold),
headline2: TextStyle(fontSize: 26.0 ,color: tWhiteColor, fontWeight: FontWeight.w700),
headline3: TextStyle(fontSize: 24.0 ,color: tWhiteColor, fontWeight: FontWeight.w700),
headline4: TextStyle(fontSize: 16.0 ,color: tWhiteColor, fontWeight: FontWeight.w600),
headline6: TextStyle(fontSize: 14.0 ,color: tWhiteColor, fontWeight: FontWeight.w600),
subtitle1: TextStyle(fontSize: 16.0,color: tWhiteColor ,fontWeight: FontWeight.bold),
bodyText1: TextStyle(fontSize: 14.0,color: tWhiteColor ,fontWeight: FontWeight.normal ),
bodyText2: TextStyle(fontSize: 12.0,color: tWhiteColor ,fontWeight: FontWeight.normal ),
    //  displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
    //   bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
);

}