import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favourite?',
      'answers': [
        {'text': 'Big ass ', 'score': 10},
        {'text': 'Big boobs', 'score': 8},
        {'text': 'Bitch', 'score': 5},
        {'text': 'Apple', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your intersets?',
      'answers': [
        {'text': 'Fuck', 'score': 10},
        {'text': 'Play gun', 'score': 8},
        {'text': 'Study', 'score': 5},
        {'text': 'Bang', 'score': 2}
      ]
    },
    {
      'questionText': 'Who\'s your wife?',
      'answers': [
        {'text': 'Dahyun', 'score': 10},
        {'text': 'Sana', 'score': 8},
        {'text': 'Jennie', 'score': 5},
        {'text': 'Wendy', 'score': 2}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    ); // A complete app
  }
}
