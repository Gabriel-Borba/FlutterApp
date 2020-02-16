import 'package:flutter/material.dart';
import 'package:flutter_first_project/result.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

var questions = [
  {
    'questionText': 'Whats your favorite animal?',
    'answers': [
      {'text': 'Shark', 'score': 10},
      {'text': 'Dog', 'score': 5},
      {'text': 'cat', 'score': 10},
      {'text': 'sheep', 'score': 7}
    ],
  },
  {
    'questionText': 'Whats your favorite color?',
    'answers': [
      {'text': 'Black', 'score': 10},
      {'text': 'Red', 'score': 7},
      {'text': 'Blue', 'score': 4},
      {'text': 'white', 'score': 8}
    ],
  },
  {
    'questionText': 'Whats your dog?',
    'answers': [
      {'text': 'sausage', 'score': 10},
      {'text': 'Golden', 'score': 8},
      {'text': 'pug', 'score': 2},
      {'text': 'labrador', 'score': 9}
    ],
  },
];

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                questionIndex: questionIndex,
                answerQuestion: answerQuestion,
                questions: questions,
              )
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
