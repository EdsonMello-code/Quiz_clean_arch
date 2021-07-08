import 'package:quiz/app/features/quiz/domain/entities/anwser_entity.dart';

class QuizDTO {
  final String imageUrl;
  final Anwser? awnsers;
  QuizDTO({
    required this.imageUrl,
    this.awnsers,
  });
}
