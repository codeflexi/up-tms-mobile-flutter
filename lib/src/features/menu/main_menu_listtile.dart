import 'package:flutter/material.dart';

class MainMenuListTile extends StatelessWidget {
  
  final IconData icon;
  final String text;
  final void Function()? onTab;
  const MainMenuListTile({
  super.key,
  required this.icon,
  required this.text,
  required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color:Colors.white,
          ),
          onTap: onTab,
          title: Text(text,
          style: const TextStyle(color:Colors.white)),
        
      ),
    );
  }
}