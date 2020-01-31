import 'dart:ui';

import 'package:flutter/material.dart';

class LikedByNumberImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage('assets/img/portraits/portrait_anna.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            '17',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.5,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.greenAccent, width: 1.5),
          ),
        ),
      ],
    );
  }
}
