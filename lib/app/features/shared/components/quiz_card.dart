import 'package:flutter/material.dart';
import 'package:quiz/app/features/shared/colors/primary_colors.dart';

class QuizCard extends StatelessWidget {
  final bool isCardUp;
  final String title;
  final String subtitle;
  final double percent;

  const QuizCard(
      {Key? key,
      required this.isCardUp,
      required this.title,
      required this.subtitle,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 140,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 11,
                color: Colors.black26,
              )
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isCardUp
                      ? Icon(
                          Icons.done_all,
                          color: Theme.of(context).iconTheme.color,
                        )
                      : Icon(
                          Icons.access_alarm,
                          color: Theme.of(context).colorScheme.iconDownColor,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: 57,
                      height: 20,
                      decoration: BoxDecoration(
                          color: isCardUp
                              ? Theme.of(context).colorScheme.upPercent
                              : Theme.of(context).colorScheme.downPercent,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isCardUp
                              ? Icon(
                                  Icons.arrow_drop_up,
                                  color:
                                      Theme.of(context).colorScheme.textUpColor,
                                )
                              : Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .arrowDropDownIconColor,
                                ),
                          Text(
                            isCardUp
                                ? '+${percent.toInt()}%'
                                : '-${percent.toInt()}%',
                            style: TextStyle(
                                fontSize: 12,
                                color: isCardUp
                                    ? Theme.of(context).colorScheme.textUpColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .textDownColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 18.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 13.0),
              child: SizedBox(
                width: 88,
                child: Text(subtitle,
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Theme.of(context).colorScheme.subtitleColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
