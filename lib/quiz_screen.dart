// quiz_screen.dart
import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': [
        {'text': 'Berlin', 'score': 0},
        {'text': 'Paris', 'score': 1},
        {'text': 'Madrid', 'score': 0},
      ],
    },
    {
      'questionText': 'Which programming language is Flutter based on?',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Dart', 'score': 1},
        {'text': 'Swift', 'score': 0},
      ],
    },
    // Add more questions as needed
  ];

  void _answerQuestion(int score) {
    _score += score;

    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < _questions.length) {
      // Display the next question
    } else {
      // Quiz completed, show score or navigate to result screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia Quiz'),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              children: [
                Question(_questions[_questionIndex]['questionText'] as String),
                ...(_questions[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(
                    () => _answerQuestion(answer['score'] as int),
                    answer['text'] as String,
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Text('Quiz completed! Your score: $_score'),
            ),
    );
  }
}
