import 'package:flutter/material.dart';
import 'package:veggly_redesign/components/userImgHero.dart';
import 'package:veggly_redesign/models/user.dart';
import 'package:veggly_redesign/screens/user/components/userProfileImgClipper.dart';

class UserScreen extends StatelessWidget {
  final User _user;

  UserScreen(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 500.0,
                child: ClipPath(
                  child: UserImageHero(_user.imgUrl),
                  clipper: UserProfileImgClipper(),
                ),
              ),
              FlatButton(
                child: Icon(Icons.clear),
                onPressed: () => Navigator.of(context).pop(),
              )
              // TODO add iconbuttons for close and options
            ],
          ),
          Column(
            children: <Widget>[
              Text(_user.getFullName()),
              Text('${_user.getDiet()}, ${_user.age}'),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  Text(_user.location),
                  Text(_user.getDistance()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
