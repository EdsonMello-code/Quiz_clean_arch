import 'package:dartz/dartz.dart';
import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';
import 'package:quiz/app/features/quiz/domain/errors/quiz_error.dart';
import 'package:quiz/app/features/quiz/domain/repositories/quiz_repository.dart';

abstract class IQuizUsecase {
  Future<Either<QuizError, void>> call(QuizDTO param);
}

class QuizUsecase implements IQuizUsecase {
  final QuizRepository quizRepository;

  QuizUsecase({required this.quizRepository});

  @override
  Future<Either<QuizError, void>> call(QuizDTO params) async {
    await quizRepository.createQuiz(params);
    return right('');
  }
}
