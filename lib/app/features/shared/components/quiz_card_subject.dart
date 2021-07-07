import 'package:flutter/material.dart';
import 'package:quiz/app/features/shared/colors/primary_colors.dart';

class QuizCardSubject extends StatelessWidget {
  final String avatar;

  final String subject;

  final double percent;

  QuizCardSubject(
      {Key? key,
      required this.avatar,
      required this.subject,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 11),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              child: Text(avatar),
              backgroundColor: Theme.of(context).colorScheme.avatarColorCard,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  subject,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('$percent% de sucesso'),
                Stack(
                  children: [
                    Container(
                      width: 133,
                      height: 7,
                      color:
                          Theme.of(context).colorScheme.lineProgressBackground,
                    ),
                    Container(
                      width: 93,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .lineProgressForeground,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: Theme.of(context).colorScheme.buttonArrowRightColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
