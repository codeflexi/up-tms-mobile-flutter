import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/auth/login/screens/login_page.dart';

//import 'package:flutter_ws_1/src/features/login/screens/login.dart';
//import 'package:flutter_ws_1/src/features/posts/screens/posts_page.dart';
import 'package:flutter_ws_1/src/utils/theme/theme.dart';
import 'package:flutter_ws_1/tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/constants/global.dart';

Future<void> main() async {
  await Global.init();

WidgetsFlutterBinding.ensureInitialized();
SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(Homestlclass(token: prefs.getString('token'),));
} 

class Homestlclass extends StatelessWidget {
  final token;

  const Homestlclass({required this.token,super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      //theme: ThemeData(fontFamily: 'Up'),
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      //home : PickupAction(),
      home: LoginPage(),
       //home: PostsPage(token: token),
        //body: (JwtDecoder.isExpired(token) == false)?PostsPage(token: token):LoginPage(),
        //body: (JwtDecoder.isExpired(token) == false)?LoginPage():LoginPage(),
    );
  }
}


// Original
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: TAppTheme.lightTheme,
  //     //theme: ThemeData(fontFamily: 'Up'),
  //     darkTheme: TAppTheme.darkTheme,
  //     themeMode: ThemeMode.light,
  //      home: PickupAction()
  //       //body: (JwtDecoder.isExpired(token) == false)?PostsPage(token: token):LoginPage(),
  //       //body: (JwtDecoder.isExpired(token) == false)?LoginPage():LoginPage(),
  //   );
  // }
