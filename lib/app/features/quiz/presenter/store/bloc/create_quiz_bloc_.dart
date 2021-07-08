import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';
// import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';
import 'package:quiz/app/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:quiz/app/features/quiz/presenter/store/quiz_state.dart';

class QuizCreateBloc extends Bloc<QuizDTO, QuizesState> {
  final QuizRepository repository;

  QuizCreateBloc({required this.repository}) : super(const StartState());

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
