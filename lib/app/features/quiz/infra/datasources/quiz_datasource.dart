import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';
import 'package:quiz/app/features/quiz/domain/entities/quiz_entity.dart';
import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';

abstract class QuizDatasource {
  Future<void> createQuizDatasource(QuizDTO params);
  Future<List<QuizEntityBase>> listQuizesDatasource();
}
