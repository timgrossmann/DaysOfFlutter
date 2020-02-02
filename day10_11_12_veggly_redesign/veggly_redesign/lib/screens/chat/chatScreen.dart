import 'package:flutter/material.dart';
import 'package:veggly_redesign/components/userAccountCircle.dart';
import 'package:veggly_redesign/screens/chat/components/chatHeader.dart';
import 'package:veggly_redesign/screens/chat/components/chatsList.dart';
import 'package:veggly_redesign/screens/chat/components/newMatches.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage('assets/img/logo_banner.png'),
          fit: BoxFit.contain,
          height: 60,
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black54,
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          UserAccountCircle(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NewMatchesWidget(),
          ChatHeaderWidget(),
          ChatsWidget(),
        ],
      ),
    );
  }
}
