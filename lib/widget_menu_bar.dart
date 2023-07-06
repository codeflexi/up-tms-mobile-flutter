import 'package:flutter/material.dart';

class ListBottomBar extends StatelessWidget {

String menuName;
IconData menuIcon;


 ListBottomBar({
 required this.menuName,
  this.menuIcon = Icons.home,
 });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(menuIcon, color: Colors.white),
            Text(
              menuName,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}