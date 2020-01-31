import 'package:flutter/material.dart';
import 'package:veggly_redesign/components/userImgHero.dart';
import 'package:veggly_redesign/screens/user/components/imageDetail.dart';
import 'package:veggly_redesign/screens/user/components/userProfileImgClipper.dart';

class UserProfileHeaderImg extends StatelessWidget {
  final String _userImg;

  UserProfileHeaderImg(this._userImg);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ClipPath(
        // TODO make horizontally scrolling list of items
        child: GestureDetector(
          child: UserImageHero(_userImg),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageDetail(_userImg),
              )),
        ),
        clipper: UserProfileImgClipper(),
      ),
    );
  }
}
