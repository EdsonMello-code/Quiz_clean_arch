import 'package:quiz/app/features/quiz/domain/entities/quiz_entity.dart';
import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';
import 'package:quiz/app/features/quiz/domain/errors/quiz_error.dart';
import 'package:dartz/dartz.dart';
import 'package:quiz/app/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:quiz/app/features/quiz/infra/datasources/quiz_datasource.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizDatasource quizDatasource;

  QuizRepositoryImpl({required this.quizDatasource});

  @override
  Future<Either<QuizError, void>> createQuiz(params) async {
    try {
      await quizDatasource.createQuizDatasource(params);
      return right('');
    } on QuizError catch (e) {
      return left(e);
    } on Exception {
      throw Exception('Unexpected error');
    }
  }

  @override
  Future<Either<QuizError, List<QuizEntityBase>>> listQuizes() async {
    try {
      final quizes = await quizDatasource.listQuizesDatasource();
      return right(quizes);
    } on QuizError catch (error) {
      return left(error);
    } on Exception {
      throw Exception('Unexpected error');
    }
  }
}
