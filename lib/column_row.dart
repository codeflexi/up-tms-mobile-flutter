import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ws_1/widget_menu_bar.dart';

class ColumnRow extends StatelessWidget {
  const ColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade700,
        appBar: AppBar(
          title: Text("Rows and Columns"),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.black87,
          foregroundColor: Colors.yellow,
          elevation: 10.0,
          //mini: true,
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5.0,
          shape: CircularNotchedRectangle(),
          color: Colors.black87,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                ListBottomBar(menuName:"Home" ,
                menuIcon: Icons.home),
               
                  ListBottomBar(menuName:"lap" ,
                menuIcon: Icons.laptop),
               
                  ListBottomBar(menuName:"sale" ,
                menuIcon: Icons.shopping_cart),
               
                  ListBottomBar(menuName:"Home" ,
                menuIcon: Icons.home),
               
              
             
               ]),
        ),
        body: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.phone,
              size: 35.0,
            ),
            Icon(
              Icons.alt_route,
              size: 35.0,
            ),
            Icon(
              Icons.share,
              size: 35.0,
            ),
          ],
        ),
        ),
        );
  }
}


