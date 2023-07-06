import 'package:flutter/material.dart';
import 'package:flutter_ws_1/gesture_detector_page.dart';
import 'package:flutter_ws_1/image.dart';
import 'package:flutter_ws_1/src/barcode_scanner.dart';
import 'package:flutter_ws_1/src/features/home/screens/home.dart';
import 'package:flutter_ws_1/src/features/auth/login/screens/login_page.dart';
import 'package:flutter_ws_1/src/features/posts/screens/posts_page.dart';
//import 'package:flutter_ws_1/src/features/login/screens/login.dart';
//import 'package:flutter_ws_1/src/features/posts/screens/posts_page.dart';
import 'package:flutter_ws_1/src/utils/theme/theme.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(CTStatelessClass(token: prefs.getString('token'),));
} 

class CTStatelessClass extends StatelessWidget {
  final token;

  const CTStatelessClass({required this.token,super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      //theme: ThemeData(fontFamily: 'Up'),
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
       body: ImagePage()
        //body: (JwtDecoder.isExpired(token) == false)?PostsPage(token: token):LoginPage(),
        //body: (JwtDecoder.isExpired(token) == false)?LoginPage():LoginPage(),
        )
    );
  }
}




