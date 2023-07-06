import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyTextFieldwhite extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData myIcon;
  final Color prefixIconColor;

  const MyTextFieldwhite({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIconColor = Colors.black38,
    this.myIcon = Icons.verified_user_outlined,
  });

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            prefixIcon: Icon(myIcon,color: prefixIconColor,),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}