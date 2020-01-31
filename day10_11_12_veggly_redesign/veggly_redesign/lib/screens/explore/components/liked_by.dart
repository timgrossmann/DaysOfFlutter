import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:veggly_redesign/screens/explore/components/likedByNumberImage.dart';

class LikedBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 40.0,
                width: 40.0,
                child: LikedByNumberImage(),
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                'People liked you',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Positioned(
            right: 10.0,
            top: 0.0,
            child: IconButton(
              icon: Icon(Icons.filter_list),
              iconSize: 35.0,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
