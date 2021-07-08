import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:quiz/app/features/quiz/presenter/store/quiz_state.dart';

class ListQuizBloc extends Cubit<QuizesState> {
  final QuizRepository repository;

  ListQuizBloc({required this.repository}) : super(StartState());

  listQuizes() async {
    final quizes = await repository.listQuizes();
    return emit(
        quizes.fold((l) => ErrorState(error: l), (r) => SuccessState(list: r)));
  }
}
