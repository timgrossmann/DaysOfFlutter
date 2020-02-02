import 'package:flutter/material.dart';
import 'package:veggly_redesign/data/users.dart';
import 'package:veggly_redesign/screens/chat/components/redMessageIndicator.dart';

class ChatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              bottom: 10.0,
            ),
            child: ListTile(
              onTap: () => {},
              title: Text(chatUsers[index].getFullName()),
              subtitle:
                  Text('Haha, you are right, it really is on the rise...'),
              leading: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(chatUsers[index].imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              trailing: RedCircleMessageIndicator(),
            ),
          );
        },
      ),
    );
  }
}
