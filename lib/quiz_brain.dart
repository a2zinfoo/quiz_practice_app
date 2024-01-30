import 'package:quiz_practice_app/question.dart';

class QuizBrain {
  int questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    Question(
      'A slug\'s blood is green.',
      true,
    ),
  ];
  String getQuestionText(int questionNumber) {
    return _questionBank[questionNumber].questionText ?? "";
  }

  bool getQuestionAnswer(int questionNumber) {
    return _questionBank[questionNumber].questionAnswer!;
  }

  void nextQuestion() {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
    } else {
      // ignore: avoid_print
      print('questens completed');
    }
  }
}
