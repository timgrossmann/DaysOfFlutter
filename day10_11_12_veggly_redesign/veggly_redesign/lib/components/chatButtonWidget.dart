import 'package:flutter/material.dart';
import 'package:veggly_redesign/components/redCircleIndicator.dart';
import 'package:veggly_redesign/screens/chat/chatScreen.dart';

class ChatButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0),
      child: IconButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(),
          ),
        ),
        iconSize: 35.0,
        color: Colors.white,
        icon: Stack(
          children: <Widget>[
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 0.5,
                  colors: <Color>[
                    Colors.green,
                    Colors.blue,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Icon(Icons.chat_bubble_outline),
            ),
            RedCircleIndicator(),
          ],
        ),
      ),
    );
  }
}
