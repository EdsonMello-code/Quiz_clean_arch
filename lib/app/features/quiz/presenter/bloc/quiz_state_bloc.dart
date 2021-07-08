import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';
import 'package:quiz/app/features/quiz/domain/errors/quiz_error.dart';

abstract class QuizesState {}

class StartState implements QuizesState {
  const StartState();
}

class LoadingState implements QuizesState {
  const LoadingState();
}

class ErrorState implements QuizesState {
  final QuizError error;
  const ErrorState({required this.error});
}

class SuccessState implements QuizesState {
  final bool isList;
  final List<QuizEntityBase>? list;
  const SuccessState({this.list, this.isList = false});
}
