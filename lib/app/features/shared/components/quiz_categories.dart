import 'package:flutter/material.dart';

class QuizCategory extends StatelessWidget {
  const QuizCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFF00CB9A),
              ),
              width: 124,
              height: 124,
              child: Center(
                child: Image.asset(
                  'assets/images/portugues.png',
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text('Português')
          ],
        ),
      ),
    );
  }
}
