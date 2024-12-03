import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class SetupScreen extends StatefulWidget {
  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  int _numQuestions = 10;
  String _category = "9"; // Default: General Knowledge
  String _difficulty = "easy";
  String _type = "multiple";

  final categories = <String, String>{
    "General Knowledge": "9",
    "Sports": "21",
    "Movies": "11",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Setup")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: _numQuestions,
                items: [5, 10, 15]
                    .map((num) => DropdownMenuItem(value: num, child: Text("$num Questions")))
                    .toList(),
                onChanged: (val) => setState(() => _numQuestions = val!),
              ),
              DropdownButton<String>(
                value: _category,
                items: categories.entries
                    .map((entry) => DropdownMenuItem(value: entry.value, child: Text(entry.key)))
                    .toList(),
                onChanged: (val) => setState(() => _category = val!),
              ),
              DropdownButton<String>(
                value: _difficulty,
                items: ["easy", "medium", "hard"]
                    .map((level) => DropdownMenuItem(value: level, child: Text(level.capitalize())))
                    .toList(),
                onChanged: (val) => setState(() => _difficulty = val!),
              ),
              DropdownButton<String>(
                value: _type,
                items: ["multiple", "boolean"]
                    .map((type) => DropdownMenuItem(value: type, child: Text(type.capitalize())))
                    .toList(),
                onChanged: (val) => setState(() => _type = val!),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        numQuestions: _numQuestions,
                        category: _category,
                        difficulty: _difficulty,
                        type: _type,
                      ),
                    ),
                  );
                },
                child: Text("Start Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
