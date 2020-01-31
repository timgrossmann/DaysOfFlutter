import 'package:flutter/material.dart';
import 'package:veggly_redesign/data/users.dart';
import 'package:veggly_redesign/screens/explore/components/liked_by.dart';
import 'package:veggly_redesign/screens/explore/components/usercard.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return LikedBy();
        }

        return UserCard(users[index - 1]);
      },
    );
  }
}
