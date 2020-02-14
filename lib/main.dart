import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Whats your favorite animal?',
        'answers': ['Shark', 'Dog', 'Cat', 'Wolf'],
      },
      {
        'questionText': 'Whats your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'Whats your dog?',
        'answers': ['sausage', 'golden', 'pug', 'labrador'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[questionIndex]['questionText'],
            ),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
