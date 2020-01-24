import 'package:flutter/material.dart';

class ExploreUserContainerInfo extends StatelessWidget {
  final String _firstName;
  final int _age;
  final String _diet;
  final String _distance;

  ExploreUserContainerInfo({String name, int age, String diet, String distance})
      : _firstName = name,
        _age = age,
        _diet = diet,
        _distance = distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
        left: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '$_firstName, ',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                _age.toString(),
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '$_diet, ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                _distance,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 18.0,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
