import 'package:flutter/material.dart';
import 'package:quiz/app/features/quiz/presenter/views/quiz_question_view.dart';
import 'package:quiz/app/features/quiz/presenter/views/quiz_view.dart';

import 'views/quizes_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/category',
      routes: {
        '/category': (_) => const QuizesView(),
        '/home': (_) => QuizView(),
        '/anwser': (_) => QuizQuestionView()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: const Color(0xFFE8FAF3),
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFF6E6DFF),
          foregroundColor: const Color(0xFF2D4464),
        ),
        primaryColor: const Color(0xff8E9192),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 12),
        ),
        iconTheme:
            const IconThemeData(color: const Color(0xFF44FFDD), size: 24),
      ),
    );
  }
}
