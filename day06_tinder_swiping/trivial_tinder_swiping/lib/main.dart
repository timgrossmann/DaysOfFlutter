import 'package:flutter/material.dart';

import 'models/cats.dart';

void main() => runApp(SwipingApp());

class SwipingApp extends StatefulWidget {
  @override
  _SwipingAppState createState() => _SwipingAppState();
}

class _SwipingAppState extends State<SwipingApp> {
  void _removeCard(cat) {
    setState(() {
      cats.remove(cat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(45, 45, 60, 1.0),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: (cats.length * 4).toDouble(),
                    ),
                    Stack(
                      children: cats
                          .map((cat) => Container(
                                width: 400 - (cat.id * 20),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: cat.id * 20,
                                    ),
                                    SelectionCard(cat, _removeCard)
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  final Cat _cat;
  final Function _onDragEnd;

  SelectionCard(this._cat, this._onDragEnd);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      onDragEnd: (drag) {
        if ((drag.offset.dx.abs() > 150)) {
          _onDragEnd(_cat);
        }
      },
      feedback: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: CardContent(_cat.name, _cat.info, _cat.image),
      ),
      childWhenDragging: CardDragging(),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: CardContent(_cat.name, _cat.info, _cat.image),
      ),
    );
  }
}

class CardDragging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<Widget> choiceButtons = [
  RaisedButton(
    textColor: Colors.white,
    color: Color.fromRGBO(45, 45, 60, 1.0),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
    ),
    child: Icon(Icons.thumb_up),
    onPressed: () => {},
  ),
  RaisedButton(
    textColor: Colors.white,
    color: Color.fromRGBO(45, 45, 60, 1.0),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
    ),
    child: Icon(Icons.delete_forever),
    onPressed: () => {},
  ),
];

class CardContent extends StatelessWidget {
  final String _name;
  final String _info;
  final String _img;

  CardContent(this._name, this._info, this._img);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Container(
        height: 500,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 250,
              child: Image(
                image: AssetImage(_img),
              ),
            ),
            Text(
              _name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              width: 200,
              child: Text(_info),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: choiceButtons,
            ),
          ],
        ),
      ),
    );
  }
}
