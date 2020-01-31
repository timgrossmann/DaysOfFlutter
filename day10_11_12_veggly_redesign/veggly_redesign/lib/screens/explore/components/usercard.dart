import 'package:flutter/material.dart';
import 'package:veggly_redesign/config/layout.dart';
import 'package:veggly_redesign/models/user.dart';
import 'package:veggly_redesign/screens/explore/components/imgContainer.dart';
import 'package:veggly_redesign/screens/explore/components/userInformationCard.dart';
import 'package:veggly_redesign/screens/user/userScreen.dart';

class UserCard extends StatelessWidget {
  final User _user;

  UserCard(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: LayoutConfig.exploreSymmetricalHorInset,
        left: LayoutConfig.exploreSymmetricalHorInset,
        bottom: LayoutConfig.exploreSymmetricalVerInset,
      ),
      child: Stack(
        children: <Widget>[
          UserInformationCard(_user),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserScreen(_user),
              ),
            ),
            child: ImageContainer(_user.imgUrl),
          ),
        ],
      ),
    );
  }
}
