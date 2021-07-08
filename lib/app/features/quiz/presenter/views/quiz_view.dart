import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';
import 'package:quiz/app/features/quiz/domain/usecases/create_quiz_usecase.dart';
import 'package:quiz/app/features/quiz/externals/datasources/quiz_datasource_impl.dart';
import 'package:quiz/app/features/quiz/infra/repositories/quiz_repository_impl.dart';
import 'package:quiz/app/features/quiz/presenter/store/bloc/create_quiz_bloc_.dart';
import 'package:quiz/app/features/quiz/presenter/store/cubit/list_quiz_cubit.dart';
import 'package:quiz/app/features/quiz/presenter/store/quiz_state.dart';
import 'package:quiz/app/features/shared/colors/primary_colors.dart';
import 'package:quiz/app/features/shared/components/quiz_card.dart';
import 'package:quiz/app/features/shared/components/quiz_card_subject.dart';
import 'package:quiz/app/features/shared/strings/strings.dart';
import 'package:sqlite3/sqlite3.dart' hide Row;

class QuizView extends StatefulWidget {
  QuizView({Key? key}) : super(key: key);

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> with TickerProviderStateMixin {
  late final QuizUsecase quizUsecase;
  late final ListQuizBloc quizListBloc;
  late final QuizCreateBloc quizCreateBloc;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    quizListBloc = ListQuizBloc(
      repository: QuizRepositoryImpl(
        quizDatasource: QuizDatasourceImpl(
          database: sqlite3,
        ),
      ),
    );

    quizCreateBloc = QuizCreateBloc(
      repository: QuizRepositoryImpl(
        quizDatasource: QuizDatasourceImpl(
          database: sqlite3,
        ),
      ),
    );

    quizCreateBloc.add(QuizDTO(imageUrl: 'B'));

    quizListBloc.listQuizes();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    quizListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 179,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 4)],
                gradient: LinearGradient(
                  begin: const Alignment(-0.24, 0.8),
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryAppBar,
                    Theme.of(context).colorScheme.secondAppBar
                  ],
                ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(37),
                    bottomRight: const Radius.circular(37))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/category');
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      )),
                ),
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 30,
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Text(
                        'Edson',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              Strings.title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryColor,
                  fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const QuizCard(
                isCardUp: true,
                percent: 60.0,
                title: '18/20',
                subtitle: 'Respostas corretas obtidas',
              ),
              const QuizCard(
                isCardUp: false,
                title: '33min.',
                subtitle: 'Melhor tempo para responder o quiz',
                percent: 80,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.subtitle,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryColor),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 200,
                  child: BlocBuilder<ListQuizBloc, QuizesState>(
                    bloc: quizListBloc,
                    builder: (_, state) {
                      if (state is ErrorState) {
                        return Text('${state.error.message}');
                      }

                      if (state is LoadingState) {
                        return const CircularProgressIndicator();
                      }

                      if (state is SuccessState) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: state.list!
                                .map((quiz) => QuizCardSubject(
                                      avatar: quiz.imageUrl,
                                      percent: 90,
                                      subject: 'Português',
                                    ))
                                .toList(),
                          ),
                        );
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
