import 'package:flutter/material.dart';

class TutorialOverlay extends StatelessWidget {
  final bool _doDisplay;
  final Function _onButtonPress;

  TutorialOverlay(this._doDisplay, this._onButtonPress);

  @override
  Widget build(BuildContext context) {
    return _doDisplay
        ? Container(
            alignment: Alignment.topCenter,
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .10,
                right: 20.0,
                left: 20.0),
            child: new Container(
              height: 500.0,
              width: MediaQuery.of(context).size.width,
              child: new Card(
                child: Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Simple Todo App',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Add entries using the blue Plus button'),
                                Image(
                                  image: AssetImage(
                                      'assets/images/blue_button.png'),
                                  height: 25,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                      'Delete entries by swiping them left')
                                ),
                                Image(
                                  image: AssetImage('assets/images/delete.png'),
                                  width: 200,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        child: Text('Ok'),
                        onPressed: _onButtonPress,
                        color: Colors.blue[400],
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                elevation: 4.0,
              ),
            ),
          )
        : Container();
  }
}
