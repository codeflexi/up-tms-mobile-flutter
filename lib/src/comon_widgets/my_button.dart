import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/constants/text_strings.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String bText;

  const MyButton({super.key, required this.onTap,required this.bText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            tLogin,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
