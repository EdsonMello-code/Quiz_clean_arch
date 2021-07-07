import 'package:flutter/material.dart';
import 'package:quiz/app/features/shared/colors/primary_colors.dart';
import 'package:quiz/app/features/shared/components/quiz_card.dart';
import 'package:quiz/app/features/shared/components/quiz_card_subject.dart';

class QuizView extends StatelessWidget {
  QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 179,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 4)],
                gradient: LinearGradient(
                  begin: Alignment(-0.24, 0.8),
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryAppBar,
                    Theme.of(context).colorScheme.secondAppBar
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(37),
                    bottomRight: Radius.circular(37))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      )),
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 30,
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Text(
                        'Edson',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              'NESSA SEMANA',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryColor,
                  fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuizCard(
                isCardUp: true,
                percent: 60.0,
                title: '18/20',
                subtitle: 'Respostas corretas obtidas',
              ),
              QuizCard(
                  isCardUp: false,
                  title: '33min.',
                  subtitle: 'Melhor tempo para responder o quiz',
                  percent: 80)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quizes',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryColor)),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 200,
                  child: ListView(
                    children: [
                      QuizCardSubject(
                        avatar: 'a',
                        percent: 90,
                        subject: 'Português',
                      ),
                      QuizCardSubject(
                        avatar: 'b',
                        percent: 60,
                        subject: 'Matemáticas',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
