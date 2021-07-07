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
        '/category': (_) => QuizesView(),
        '/home': (_) => QuizView(),
        '/anwser': (_) => QuizQuestionView()
      },
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: Color(0xFFE8FAF3),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF6E6DFF),
          foregroundColor: Color(0xFF2D4464),
        ),
        primaryColor: Color(0xff8E9192),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 12),
        ),
        iconTheme: IconThemeData(color: Color(0xFF44FFDD), size: 24),
      ),
    );
  }
}
