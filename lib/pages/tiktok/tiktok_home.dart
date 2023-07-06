import 'package:flutter/material.dart';
import 'package:flutter_ws_1/pages/tiktok/screens/home.dart';
import 'package:flutter_ws_1/pages/tiktok/screens/inbox.dart';
import 'package:flutter_ws_1/pages/tiktok/screens/plus.dart';
import 'package:flutter_ws_1/pages/tiktok/screens/profile.dart';
import 'package:flutter_ws_1/pages/tiktok/screens/search.dart';


class TikTokPagState extends StatefulWidget {
  const TikTokPagState({Key? key}) : super(key: key);

  @override
  _TikTokPagStateState createState() => _TikTokPagStateState();
}

class _TikTokPagStateState extends State<TikTokPagState> {
  // bottom nav bar
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHomePage(),
    UserSearchPage(),
    UserPlusPage(),
    UserInboxPage(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}