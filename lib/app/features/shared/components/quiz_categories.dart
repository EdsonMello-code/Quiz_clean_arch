import 'package:flutter/material.dart';
import 'package:quiz/app/features/shared/colors/primary_colors.dart';

class QuizCategory extends StatelessWidget {
  final String category;

  const QuizCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/anwser');
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.categoryBackground,
              ),
              width: 124,
              height: 124,
              child: Center(
                child: Image.asset(
                  'assets/images/portugues.png',
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(category)
          ],
        ),
      ),
    );
  }
}
