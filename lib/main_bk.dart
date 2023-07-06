
import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/comon_widgets/widget_app_bar.dart';
//import 'package:flutter_ws_1/column_row.dart';
//import 'package:flutter_ws_1/list_view.dart';
import 'package:flutter_ws_1/src/utils/theme/theme.dart';
import 'package:flutter_ws_1/theme_example.dart';

//import 'package:flutter_ws_1/theme_example.dart';
//import 'package:flutter_ws_1/gradient_container.dart';



void main() {
  runApp(
      MaterialApp(
      theme: TAppTheme.lightTheme,
      //theme: ThemeData(fontFamily: 'Up'),
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      
        home: const Scaffold(
        body: ThemeExample()
      ),
    ),
  );
}

