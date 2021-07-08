import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';
// import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';
import 'package:quiz/app/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:quiz/app/features/quiz/presenter/bloc/quiz_state_bloc.dart';

class QuizBloc extends Bloc<QuizDTO, QuizesState> {
  final QuizRepository repository;

  QuizBloc({required this.repository}) : super(const StartState());

  @override
  Stream<QuizesState> mapEventToState(entity) async* {
    yield const LoadingState();
    const message = 'Executado';
    print(message);
    final quizesFold = await repository.createQuiz(entity);

    yield quizesFold.fold((l) {
      return ErrorState(error: l);
    }, (r) => const SuccessState(isList: true));
  }
}
