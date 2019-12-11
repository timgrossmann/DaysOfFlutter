import 'package:flutter/material.dart';

Color getColorFor(String color) {
  switch (color) {
    case 'orange':
      return Colors.orange;
      
    case 'red':
      return Colors.red;

    case 'blue':
        return Colors.blue;

    case 'teal':
        return Colors.teal;

    default:
      return Colors.white;
  }
}