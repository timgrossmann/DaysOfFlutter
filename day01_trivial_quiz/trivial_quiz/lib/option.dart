import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String _optionText;
  Function _onPress;

  Option(this._optionText, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(_optionText),
        onPressed: _onPress,
      ),
    );
  }
}
