import 'package:quiz/app/features/quiz/externals/datasources/models/quiz_model.dart';
import 'package:quiz/app/features/quiz/infra/datasources/quiz_datasource.dart';
import 'package:sqlite3/sqlite3.dart';

class QuizDatasourceImpl implements QuizDatasource {
  final Sqlite3 database;

  QuizDatasourceImpl({required this.database});
  @override
  Future<void> createQuizDatasource(params) async {
    final connection = database.open('quiz.db');

    connection.execute('''
      CREATE TABLE IF NOT EXISTS quizes(
	    id INTEGER PRIMARY KEY AUTOINCREMENT,
	    imageUrl TEXT NOT NULL
      );
    ''');

    // connection.execute('''
    //   CREATE TABLE IF NOT EXISTS awnsers(
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     category TEXT NOT NULL,
    //     position TEXT NOT NULL,
    //     content TEXT NOT NULL,
    //     quiz_id INTEGER,
    //     FOREIGN KEY(quiz_id) REFERENCES quizes(id)
    //   );
    // ''');

    final insertPreparedQuiz =
        connection.prepare('INSERT INTO quizes(imageUrl) VALUES(?)');

    insertPreparedQuiz.execute([params.imageUrl]);

    insertPreparedQuiz.dispose();
    connection.dispose();
  }

  @override
  Future<List<QuizModel>> listQuizesDatasource() async {
    final connection = database.open('quiz.db');

    connection.execute('''
      CREATE TABLE IF NOT EXISTS quizes(
	    id INTEGER PRIMARY KEY AUTOINCREMENT,
	    imageUrl TEXT NOT NULL
      );
    ''');

    final quizesRows = connection.select('SELECT * FROM quizes');
    final quizes =
        quizesRows.map((quizMap) => QuizModel.fromMap(quizMap)).toList();

    return quizes;
  }
}
