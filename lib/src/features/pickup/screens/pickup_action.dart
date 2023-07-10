import "package:flutter/material.dart";
import 'package:flutter_ws_1/src/constants/colors.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/shipment_cart.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/shipment_list.dart';
import 'package:flutter_ws_1/src/features/pickup/utils/bottom_nav_bar.dart';
import 'package:flutter_ws_1/src/features/tracking/screens/qr_scan_page.dart';

class PickupAction extends StatefulWidget {
  const PickupAction({super.key,required this.pickId , required this.formPage });
  final String pickId;
  final String formPage;
  

  @override
  State<PickupAction> createState() => _PickupActionState();
}

class _PickupActionState extends State<PickupAction> {
  
  // navigate bottom baar
  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
     
    });
  }

// pages
late List<Widget> _pages = [
  //ShipmentListPage
  ShipmentListPage(pickId: widget.pickId , fromPage: widget.formPage,),

  QrScanPage(pickId: widget.pickId , fromPage: widget.formPage,),

  ShipmentCart(), 


];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBackgroundColor,
      bottomNavigationBar : BottomNavBar(
        onTabChange:(index) => navigateBottomBar(index) ,),
        body: _pages[_selectedIndex],
    );
  }
}