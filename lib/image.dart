import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blue,
            child: 
            Image.asset('assets/images/menu1.jpeg',
            fit: BoxFit.cover,
            ),),
        ),
      ),
    );
  }
}