import "package:flutter/material.dart";

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("tuk Statful Widgets Flutter - 3.1"),
      centerTitle: true,
    );
  }
}