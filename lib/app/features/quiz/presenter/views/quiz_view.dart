import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/features/quiz/domain/DTOs/QuizDTO.dart';
import 'package:quiz/app/features/quiz/domain/entities/quiz_entity.dart';
import 'package:quiz/app/features/quiz/domain/entities/quiz_entity_base.dart';
import 'package:quiz/app/features/quiz/domain/usecases/create_quiz_usecase.dart';
import 'package:quiz/app/features/quiz/externals/datasources/quiz_datasource_impl.dart';
import 'package:quiz/app/features/quiz/infra/repositories/quiz_repository_impl.dart';
import 'package:quiz/app/features/quiz/presenter/bloc/create_quiz_bloc_.dart';
import 'package:quiz/app/features/quiz/presenter/bloc/list_quiz_bloc.dart';
import 'package:quiz/app/features/quiz/presenter/bloc/quiz_state_bloc.dart';
import 'package:quiz/app/features/shared/colors/primary_colors.dart';
import 'package:quiz/app/features/shared/components/quiz_card.dart';
import 'package:sqlite3/sqlite3.dart' hide Row;

class QuizView extends StatefulWidget {
  QuizView({Key? key}) : super(key: key);

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> with TickerProviderStateMixin {
  late final QuizUsecase quizUsecase;
  late final ListQuizBloc quizBloc;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    quizBloc = ListQuizBloc(
      repository: QuizRepositoryImpl(
        quizDatasource: QuizDatasourceImpl(
          database: sqlite3,
        ),
      ),
    );

    quizBloc.listQuizes();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    quizBloc.close();
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
                  begin: Alignment(-0.24, 0.8),
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryAppBar,
                    Theme.of(context).colorScheme.secondAppBar
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(37),
                    bottomRight: Radius.circular(37))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      )),
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 30,
                      ),
                      SizedBox(
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
          SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              'NESSA SEMANA',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryColor,
                  fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuizCard(
                isCardUp: true,
                percent: 60.0,
                title: '18/20',
                subtitle: 'Respostas corretas obtidas',
              ),
              QuizCard(
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
                  'Quizes',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryColor),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 200,
                  child: BlocBuilder<ListQuizBloc, QuizesState>(
                    bloc: quizBloc,
                    builder: (_, state) {
                      if (state is ErrorState) {
                        return Text('${state.error}');
                      }

                      if (state is LoadingState) {
                        return CircularProgressIndicator();
                      }

                      if (state is SuccessState) {
                        return ListView(
                          children: state.list!
                              .map((quiz) => Text(quiz.imageUrl))
                              .toList(),
                        );
                      }

                      return Container();
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
