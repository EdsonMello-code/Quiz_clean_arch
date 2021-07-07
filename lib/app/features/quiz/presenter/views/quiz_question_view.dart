import 'package:flutter/material.dart';
import 'package:quiz/app/features/shared/components/quiz_awnser.dart';

class QuizQuestionView extends StatelessWidget {
  const QuizQuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 80),
              child: Container(
                  width: 325,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 4, color: Colors.black38)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 217,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Color(0xFFEADEEE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Icon(Icons.done_all),
                      Text('0/8')
                    ],
                  )),
            ),
          ),
          QuizAwanser(
            order: 'A',
          ),
          QuizAwanser(
            order: 'B',
            isCorrect: true,
          ),
          QuizAwanser(
            order: 'C',
          ),
          QuizAwanser(
            order: 'D',
          ),
        ],
      ),
    );
  }
}
