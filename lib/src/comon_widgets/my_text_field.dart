

//Custom Stateless Widget Class that helps re-usability

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
required this.fieldName,
required this.myController,
this.myIcon = Icons.verified_user_outlined,
this.prefixIconColor = Colors.red,
    }) : super(key: key);

final TextEditingController myController;
final String fieldName;
final IconData myIcon;
final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon,color:prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.red.shade300),
        ),
        labelStyle: const TextStyle(color:Colors.red)
      ),
    );
  }
}