import 'package:flutter/material.dart';
import 'colours.dart';



Widget spinner() {
//Change to main colour
  return Container(
    child:
  Center(
    child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Colours.mainGreen),
    ),
  ));
}