import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white60,
            ),
            onTap: () => null,
          ),
          Text(
            'Yogyakarta',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 15,
              letterSpacing: 1.2,
            ),
          ),
          GestureDetector(
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 12,
                letterSpacing: 1.5,
              ),
            ),
            onTap: () => null,
          )
        ],
      ),
    );
  }
}
