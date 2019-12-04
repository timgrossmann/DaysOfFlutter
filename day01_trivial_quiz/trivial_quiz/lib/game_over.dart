import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final int _score;
  final int _maxScore;
  final Function _onRedoPress;

  GameOver(this._score, this._maxScore, this._onRedoPress);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('You\'ve scored:'),
          Text(
            '${_score.toString()} / ${_maxScore.toString()}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
          ),
          RaisedButton(
            child: Icon(Icons.redo),
            onPressed: _onRedoPress,
          ),
        ]);
  }
}
