import 'package:flutter/material.dart';
import 'package:veggly_redesign/data/loggedInUser.dart';

class UserAccountCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50.0,
      onPressed: () => {},
      icon: Container(
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.lightGreen, Colors.lightBlue]),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage(loggedInUser.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
