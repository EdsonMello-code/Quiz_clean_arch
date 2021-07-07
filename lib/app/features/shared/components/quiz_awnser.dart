import 'package:flutter/material.dart';

class QuizAwanser extends StatelessWidget {
  final bool isCorrect;

  final String order;

  const QuizAwanser({Key? key, this.isCorrect = false, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Clicado');
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: isCorrect
                  ? LinearGradient(
                      colors: [Color(0xFF5C52E8), Color(0xFFDF51AF)],
                      stops: [.3, 1],
                      begin: Alignment(-1.0, -2.0),
                      end: Alignment(.3, 1.0))
                  : null,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black26,
                  spreadRadius: 1,
                  offset: Offset(0, 4),
                )
              ]),
          width: 311,
          height: 78,
          child: Padding(
            padding: const EdgeInsets.only(left: 29.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      !isCorrect ? Color(0xFFE6E6EF) : Color(0xFF6659EC),
                  child: Text(
                    order,
                    style: TextStyle(
                        color: isCorrect ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  maxRadius: 26,
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    Text('H'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('2', style: TextStyle(fontSize: 10)),
                    ),
                    Text('O')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
