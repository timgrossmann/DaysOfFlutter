import 'package:flutter/material.dart';
import 'package:veggly_redesign/models/user.dart';
import 'package:veggly_redesign/screens/explore/components/exploreUserButtons.dart';
import 'package:veggly_redesign/screens/user/components/userProfileDetailInfo.dart';
import 'package:veggly_redesign/screens/user/components/userProfileHeaderImg.dart';
import 'package:veggly_redesign/screens/user/components/userProfileHeaderInfo.dart';
import 'package:veggly_redesign/screens/user/components/userProfileNavigation.dart';

class UserScreen extends StatelessWidget {
  final User _user;

  UserScreen(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            Stack(
              children: <Widget>[
                UserProfileHeaderImg(_user.imgUrl),
                UserProfileNavigation(),
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ExploreUserButtons(
                        likeSize: 60.0,
                        hideSize: 45.0,
                        spacing: 25.0,
                      ),
                    ],
                  ),
                  bottom: 0.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            UserProfileHeaderInfo(
              _user.getFullName(),
              _user.getDiet(),
              _user.age.toString(),
            ),
            UserProfileDetailInfo(_user.getUserInfoList()),
          ],
        ),
      ),
    );
  }
}
