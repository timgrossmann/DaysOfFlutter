import 'package:flutter/material.dart';
import 'package:veggly_redesign/models/userInfo.dart';
import 'package:veggly_redesign/screens/user/components/userProfileInfoRow.dart';

class UserProfileDetailInfo extends StatelessWidget {
  final List<UserInfo> _userInfo;

  UserProfileDetailInfo(this._userInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: Column(
        children: _userInfo.map(
          (info) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: UserProfileInfoRow(
                info.icon,
                info.primaryInfo,
                info.secondaryInfo,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
