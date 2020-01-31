import 'package:flutter/material.dart';

class UserProfileHeaderInfo extends StatelessWidget {
  final String _fullName;
  final String _diet;
  final String _age;

  UserProfileHeaderInfo(this._fullName, this._diet, this._age);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25.0,
        left: 25.0,
        right: 25.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            _fullName,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 2.5,
          ),
          Text(
            '$_diet, $_age',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w100,
              color: Colors.black45,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
