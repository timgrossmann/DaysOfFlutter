import 'package:flutter/material.dart';

class ExploreUserButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              iconSize: 25.0,
              icon: Icon(Icons.clear),
              color: Colors.white,
              onPressed: () => {},
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              iconSize: 30.0,
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
