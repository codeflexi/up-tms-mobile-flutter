import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/auth/home/home_landing_page.dart';

class MyCustomAppBar extends StatelessWidget {
   const MyCustomAppBar({
  Key? key,
  this.title = ''
  // this.leading,
  // this.titleWidget,
  // this.onMenuActionTap,
  }) : super(key: key);

  final String title;
  // final Widget? leading;
  // final Widget? titleWidget;
  // final VoidCallback? onMenuActionTap;

  // Search VoidCallback

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0,
         leading:IconButton(
            icon: Icon(Icons.home),
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeLandingPage();
          }));

              }),

    );
  }
}