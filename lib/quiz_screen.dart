// quiz_screen.dart
import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  QuizScreen({required this.category});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;
  bool _answerSubmitted =
      false; // Flag to track whether the answer has been submitted

  List<Map<String, Object>> _questions = [];

  @override
  void initState() {
    super.initState();
    // Load questions based on the selected category
    _loadQuestions();
  }

  void _loadQuestions() {
    // Replace this with logic to fetch questions based on the selected category
    // For demonstration, we'll use a dummy set of questions
    _questions = [
      {
        'questionText': 'Dummy Question 1',
        'answers': [
          {'text': 'Option 1', 'score': 1},
          {'text': 'Option 2', 'score': 0},
          {'text': 'Option 3', 'score': 0},
        ],
      },
      {
        'questionText': 'Dummy Question 2',
        'answers': [
          {'text': 'Option 1', 'score': 1},
          {'text': 'Option 2', 'score': 1},
          {'text': 'Option 3', 'score': 0},
        ],
      },
      // Add more dummy questions as needed
    ];
  }

  void _answerQuestion(int score) {
    setState(() {
      _answerSubmitted = true;
    });

    _score += score;

    // Delay to show correct/incorrect colors before moving to the next question
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        _answerSubmitted = false;
        _questionIndex++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia Quiz - ${widget.category}'),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              children: [
                Question(_questions[_questionIndex]['questionText'] as String),
                ...(_questions[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(
                    selectHandler: () =>
                        _answerQuestion(answer['score'] as int),
                    answerText: answer['text'] as String,
                    highlight:
                        _answerSubmitted && (answer['score'] as int) == 1,
                  );
                }).toList(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (!_answerSubmitted) {
                      // If the answer has not been submitted, show a message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select an answer.'),
                        ),
                      );
                    } else {
                      // Move to the next question
                      setState(() {
                        _answerSubmitted = false;
                        _questionIndex++;
                      });
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quiz completed! Your score: $_score'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the result screen or perform other actions
                    },
                    child: Text('Finish'),
                  ),
                ],
              ),
            ),
    );
  }
}
