import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final Map<String, String> _person;

  PersonCard(this._person);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.donut_large),
              Text(
                'Test',
                style: TextStyle(
                  color: Color.fromRGBO(34, 42, 56, 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
