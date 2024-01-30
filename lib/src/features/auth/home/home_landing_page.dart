import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/constants/image_strings.dart';
import 'package:flutter_ws_1/src/constants/text_strings.dart';
import 'package:flutter_ws_1/src/features/Load/screens/load_list.dart';
import 'package:flutter_ws_1/src/features/auth/login/screens/login_page.dart';
import 'package:flutter_ws_1/src/features/auth/repos/user_repo.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/delivery_list.dart';
import 'package:flutter_ws_1/src/features/direct/screens/direct_list.dart';
import 'package:flutter_ws_1/src/features/menu/main_menu_page.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_list.dart';

import '../profile/screens/profile_page.dart';

class HomeLandingPage extends StatefulWidget {
  const HomeLandingPage({super.key});

  @override
  State<HomeLandingPage> createState() => _HomeLandingPageState();
}

class _HomeLandingPageState extends State<HomeLandingPage> {

  // pages
 List<Widget> _pages = [
  //ShipmentListPage
  UserProfilePage(),
  
  PickupList(), 
];


  void goToProfilePage() {
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(
      builder:(context)=> const UserProfilePage(), ),);
  }

   void goToPickupPage() {
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(
      builder:(context)=>const PickupList(), ),);
  }

    void goToLoadPage() {
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(
      builder:(context)=>const LoadListPage(), ),);
  }

 void goToDeliveryPage() {
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(
      builder:(context)=> const DeliveryListPage(), ),);
  }

   void goToDirectPage() {
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(
      builder:(context)=> const DirectListPage(), ),);
  }


  void goToSignout() async {

     Navigator.pop(context);

    bool result = false;
    print(result);
   // tShowDialog();
    
      result = await UserRepo.userLogout();
      if (result) {
        print("user logged out");

        // Navigator.push(context, MaterialPageRoute(builder: (context)=> PostsPage(token:myToken)));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        tShowDialog();
        return;
        print('Somthing went wrong');
      }
   
  }

    void tShowDialog() {
    //MyDialog(titleText: 'พบข้อผิดพลาด',contentText: 'โปรด ตรวจสอบ รหัสผ่านอีกครั้ง!!',context: context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('พบข้อผิดพลาด'),
        content: const Text(
            'โปรดตรวจสอบ อีเมลล์ และ รหัสผ่านอีกรอบ !!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                title: const Text("H O M E"),
                  backgroundColor: Colors.grey[900],
              
              ),
        drawer: MainMenuPage(
                onProfileTap: goToProfilePage,
                onSignOutTap: goToSignout,
                onPickUpTap: goToPickupPage,
                onLoadTap:  goToLoadPage,
                onDeliveryTap: goToDeliveryPage,
                onDirectTap: goToDirectPage,
              ),
      backgroundColor: Colors.grey.shade100,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Image(image: AssetImage(tWelcomeaLogo)),
            ),
            Column(
              children: [
                Text(tWelcomeTitle,style: Theme.of(context).textTheme.headline3,),
                Text(tWelcomeSubTitle,style: Theme.of(context).textTheme.subtitle1,),
                 Text(tAppVersion,style: Theme.of(context).textTheme.bodyText1,),
              ],
            )
          ],
          ),
      )
    );
  }
}