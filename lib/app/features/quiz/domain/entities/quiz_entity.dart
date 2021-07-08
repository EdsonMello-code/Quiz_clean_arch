// import 'package:quiz/app/features/quiz/domain/entities/anwser_entity.dart';

import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';

class QuizEntity implements QuizEntityBase {
  final String imageUrl;
  final int id;
  // final List<Anwser> anwsers;

  const QuizEntity({
    required this.imageUrl,
    required this.id, //required this.anwsers
  });
}
