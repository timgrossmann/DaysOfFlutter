import 'package:flutter/material.dart';

import './data.dart';
import './quiz.dart';
import './game_over.dart';

void main() => runApp(TrivialQuiz());

class TrivialQuiz extends StatefulWidget {
  @override
  _TrivialQuizState createState() => _TrivialQuizState();
}

class _TrivialQuizState extends State<TrivialQuiz> {
  // This widget is the root of your application.
  int _currQuestion = 0;
  int _score = 0;

  void _onOptionPress(decision) {
    setState(() {
      _score =
          decision == quizData[_currQuestion]['answer'] ? ++_score : _score;
      _currQuestion++;
    });
  }

  void _resetState() {
    setState(() {
      _score = 0;
      _currQuestion = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> currQuestion =
        _currQuestion < quizData.length ? quizData[_currQuestion] : {};

    Widget element = _currQuestion < quizData.length
        ? Quiz(currQuestion, _onOptionPress)
        : GameOver(_score, quizData.length, _resetState);

    return MaterialApp(
      title: 'Trivial Quiz App',
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: element,
          ),
        ),
      ),
    );
  }
}
