import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veggly_redesign/components/chatButtonWidget.dart';
import 'package:veggly_redesign/components/userAccountCircle.dart';
import 'package:veggly_redesign/screens/explore/exploreScreen.dart';

void main() {
  // force portrait mode
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(VegglyApp());
  });
}

class VegglyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Helvetica', textTheme: TextTheme()),
      home: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Image(
            image: AssetImage('assets/img/logo_banner.png'),
            fit: BoxFit.contain,
            height: 60,
          ),
          leading: ChatButtonWidget(),
          actions: <Widget>[
            UserAccountCircle(),
          ],
        ),
        body: ExploreScreen(),
      ),
    );
  }
}
