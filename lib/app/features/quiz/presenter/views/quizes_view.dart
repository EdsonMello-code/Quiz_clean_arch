import 'package:flutter/material.dart';
import 'package:quiz/app/features/shared/components/quiz_categories.dart';

class QuizesView extends StatelessWidget {
  const QuizesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 39, top: 32),
                child: Text(
                  'Quizes',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 39,
              ),
              SizedBox(
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const QuizCategory(
                            category: 'Português',
                          ),
                          const QuizCategory(
                            category: 'Física',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const QuizCategory(
                            category: 'Química',
                          ),
                          const QuizCategory(
                            category: 'Astronomia',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const QuizCategory(
                            category: 'Sports',
                          ),
                          const QuizCategory(
                            category: 'Geografia',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
