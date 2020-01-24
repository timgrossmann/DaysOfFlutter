import 'package:flutter/material.dart';
import 'package:veggly_redesign/screens/explore/exploreScreen.dart';

void main() => runApp(VegglyApp());

class VegglyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Helvetica',

        textTheme: TextTheme(
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Image(
            image: AssetImage('assets/img/logo_banner.png'),
            fit: BoxFit.contain,
            height: 60,
          ),
          leading: IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () => {},
            color: Colors.black87,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => {},
              color: Colors.black87,
            ),
          ],
        ),
        body: ExploreScreen(),
      ),
    );
  }
}
