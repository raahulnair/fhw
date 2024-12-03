import 'package:flutter/material.dart';
import 'setup_screen.dart';
import 'quiz_screen.dart';
import 'summary_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customizable Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SetupScreen(),
        '/quiz': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return QuizScreen(
            numQuestions: args['numQuestions'],
            category: args['category'],
            difficulty: args['difficulty'],
            type: args['type'],
          );
        },
        '/summary': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return SummaryScreen(
            score: args['score'],
            total: args['total'],
          );
        },
      },
    );
  }
}
