import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

/* ---------------
 * Program Name: main.dart
 * Purpose: Create quiz app
 * Author: Muhammad Afiq
 * Date: 22 Oct 2023
 * ---------------
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // Define a lists
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        }
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 3,
        },
        {
          'text': 'Snake',
          'score': 11,
        },
        {
          'text': 'Elephant',
          'score': 5,
        },
        {
          'text': 'Lion',
          'score': 9,
        }
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {
          'text': 'Alan',
          'score': 1,
        },
        {
          'text': 'Richard',
          'score': 1,
        },
        {
          'text': 'Steven',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        }
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // print('Answer chosen..!');
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
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
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
          title: Text('My Quiz App'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Column(
                children: [
                  Quiz(
                    answerQuestion: _answerQuestion,
                    questions: _questions,
                    questionIndex: _questionIndex,
                  )
                  // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
                  // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 2')),
                  // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 3')),
                ],
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
