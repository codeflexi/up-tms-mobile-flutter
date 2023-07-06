import "package:flutter/material.dart";

class TAppBar extends StatelessWidget {
  const TAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:  IconButton(icon: const Icon(Icons.menu),onPressed: () {},),
      title: const Text("ระบบขนส่ง"),
      actions: [
IconButton(icon: const Icon(Icons.shopping_cart),onPressed: () {},),
IconButton(icon: const Icon(Icons.search),onPressed: () {},),
// IconButton(icon: const Icon(Icons.menu_book),onPressed: () {},),
      ],
      elevation: 0,
      backgroundColor: Colors.red,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius:BorderRadius.vertical(bottom: Radius.circular(20)) ),
      
    );
  }
}