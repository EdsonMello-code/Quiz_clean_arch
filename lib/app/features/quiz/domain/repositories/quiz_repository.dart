import 'package:dartz/dartz.dart';
import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';
import 'package:quiz/app/features/quiz/domain/errors/quiz_error.dart';

abstract class QuizRepository {
  Future<Either<QuizError, void>> createQuiz(QuizDTO params);
}
