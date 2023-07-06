import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/menu/main_menu_listtile.dart';

class MainMenuPage
 extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOutTap;
  final void Function()? onPickUpTap;
  final void Function()? onLoadTap;
  final void Function()? onDeliveryTap;
 final void Function()? onDirectTap;


  const MainMenuPage
  ({
    super.key,
  required this.onProfileTap,
  required this.onSignOutTap,
  required this.onPickUpTap,
  required this.onLoadTap,
  required this.onDeliveryTap,
  required this.onDirectTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      

        Column(
       
          children: [
              //header
        const DrawerHeader(child: 
        Icon(Icons.person,
        color:Colors.white,
        size:64),
        ),
            MainMenuListTile(
              icon: Icons.home, 
              text: 'H O M E',
              onTab: ()=> Navigator.pop(context),),

                MainMenuListTile(
          icon: Icons.person, 
          text: 'P R O F I L E',
          onTab: onProfileTap)
          ,
    
                MainMenuListTile(
          icon: Icons.local_shipping, 
          text: 'P I C K U P',
          onTab: onPickUpTap)
          ,

             MainMenuListTile(
          icon: Icons.pin_drop,
          text: 'D I R E C T - P I C K',
          onTab: onDirectTap)
          ,
          

      MainMenuListTile(
          icon: Icons.warehouse, 
          text: 'L O A D',
          onTab: onLoadTap)
          ,
          
            MainMenuListTile(
          icon: Icons.pin_drop,
          text: 'D E L I V E R Y',
          onTab: onDeliveryTap)
          ,

          ],
        )
          ,
 
  Padding(
    padding: const EdgeInsets.only(bottom: 25.0),
    child: MainMenuListTile(
            icon: Icons.logout, 
            text: 'L O G O U T',
            onTab: onSignOutTap),
  )
          ,

      ],),
    );
  }
}