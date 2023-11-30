// answer.dart
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  final bool highlight;

  Answer({
    required this.selectHandler,
    required this.answerText,
    this.highlight = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(
          primary: highlight ? Colors.green : null,
        ),
        child: Text(
          answerText,
          style: TextStyle(color: highlight ? Colors.white : null),
        ),
      ),
    );
  }
}
