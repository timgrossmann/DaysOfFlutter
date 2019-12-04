import 'package:flutter/material.dart';

import './option.dart';

class Quiz extends StatelessWidget {
  final Map<String, Object> _quizElement;
  final Function _onOptionPress;

  Quiz(this._quizElement, this._onOptionPress);

  @override
  Widget build(BuildContext context) {
    Text question = Text(
      _quizElement['question'],
      style: TextStyle(fontSize: 25),
      textAlign: TextAlign.center,
    );
    List<Option> options = (_quizElement['options'] as List<String>)
        .map((option) => Option(option, () => _onOptionPress(option)))
        .toList();

    return Column(
      children: <Widget>[
        question,
        Padding(
          padding: EdgeInsets.only(top: 40.0),
        ),
        ...options,
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
