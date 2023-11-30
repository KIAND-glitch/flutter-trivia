// category_screen.dart
import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'General Knowledge',
    'Programming',
    'Science',
    'History',
  ];

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Category'),
        // automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              // Navigate to the quiz screen with the selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
