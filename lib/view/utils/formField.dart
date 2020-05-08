//need to make a generic class for this to use everywhere...
import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  MyFormField(
      {@required this.controller,
      @required this.labelText,
      @required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(labelText: 
        labelText,
        border: OutlineInputBorder(),),
        controller: controller,
        obscureText: obscureText
        );
  }
}


/*
suffixIcon: IconButton(
              icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: onPressed))
*/