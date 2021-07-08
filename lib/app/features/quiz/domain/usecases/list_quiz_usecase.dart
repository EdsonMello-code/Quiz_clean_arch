import 'package:dartz/dartz.dart';
import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';
import 'package:quiz/app/features/quiz/domain/errors/quiz_error.dart';
import 'package:quiz/app/features/quiz/domain/repositories/quiz_repository.dart';

abstract class IListQuizUsecase {
  Future<Either<QuizError, List<QuizEntityBase>>> call();
}

class ListQuizUsecase implements IListQuizUsecase {
  final QuizRepository quizRepository;

  ListQuizUsecase({required this.quizRepository});
  @override
  Future<Either<QuizError, List<QuizEntityBase>>> call() async {
    final quizes = await quizRepository.listQuizes();
    return quizes;
  }
}
