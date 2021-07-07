import 'package:flutter/material.dart';
import 'package:quiz/app/features/shared/components/quiz_categories.dart';

class QuizesView extends StatelessWidget {
  const QuizesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
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
                        QuizCategory(),
                        QuizCategory(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuizCategory(),
                        QuizCategory(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuizCategory(),
                        QuizCategory(),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
