import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';

abstract class QuizDatasource {
  Future<void> createQuizDatasource(QuizDTO params);
}
