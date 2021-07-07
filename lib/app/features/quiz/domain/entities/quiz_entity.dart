import 'package:quiz/app/features/quiz/domain/entities/anwser_entity.dart';

class QuizModel {
  final String imageUrl;
  final String id;
  final List<Anwser> anwsers;

  const QuizModel(
      {required this.imageUrl, required this.id, required this.anwsers});
}
