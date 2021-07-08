import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';

class QuizModel implements QuizEntityBase {
  @override
  final int id;

  QuizModel({required this.id, required this.imageUrl});

  @override
  final String imageUrl;

  factory QuizModel.fromMap(map) {
    return QuizModel(id: map['id'], imageUrl: map['imageUrl']);
  }
}
