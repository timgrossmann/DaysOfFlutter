import 'package:flutter/material.dart';

class UserProfileNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Icon(
              Icons.clear,
              size: 30.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Icon(
              Icons.more_horiz,
              size: 30.0,
            ),
            // TODO add action items
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
