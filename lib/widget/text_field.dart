import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  Function onChanged;
  Icon icon;
  Color iconColor;
  final bool obscureText;
  final TextEditingController controller;   //save the value of text same like onChanged
  MyTextField({ this.hintText, this.onChanged,this.obscureText,@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        //prefixIcon: Icon(icon,color: Colors.blue[900],),
        hintText:hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[900]),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
