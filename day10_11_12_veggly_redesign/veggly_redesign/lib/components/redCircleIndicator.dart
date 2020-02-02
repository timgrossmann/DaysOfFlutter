import 'package:flutter/material.dart';

class RedCircleIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: Container(
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.redAccent,
        ),
        child: Center(
          child: Text(
            '1',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
