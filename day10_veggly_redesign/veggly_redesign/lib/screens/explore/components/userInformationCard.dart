import 'package:flutter/material.dart';
import 'package:veggly_redesign/config/layout.dart';
import 'package:veggly_redesign/models/user.dart';
import 'package:veggly_redesign/screens/explore/components/exploreUserButtons.dart';
import 'package:veggly_redesign/screens/explore/components/exploreUserContainerInfo.dart';

class UserInformationCard extends StatelessWidget {
  final User _user;

  UserInformationCard(this._user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height *
              (LayoutConfig.exploreImgHeightPerc - 0.01),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(LayoutConfig.exploreImgBorderRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: LayoutConfig.exploreDropShadowBlurRadius,
                    spreadRadius: LayoutConfig.exploreDropShadowSpreadRadius,
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: LayoutConfig.exploreDetailsHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ExploreUserContainerInfo(
                    name: _user.firstName,
                    age: _user.age,
                    diet: _user.getDiet(),
                    distance: _user.getDistance(),
                  ),
                  ExploreUserButtons(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
