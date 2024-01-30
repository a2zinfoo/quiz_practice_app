import 'package:flutter/material.dart';
import 'package:quiz_practice_app/quiz_brain.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];

  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                // quizBrain.questionBank[questionNumber].questionText!,
                quizBrain.getQuestionText(quizBrain.questionNumber),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                if (quizBrain.getQuestionAnswer(quizBrain.questionNumber) ==
                    true) {
                  print('correct answer');
                  scorekeeper.add(
                    const Icon(Icons.check, color: Colors.green),
                  );
                } else {
                  print('wrong answer');
                  scorekeeper.add(
                    const Icon(Icons.close, color: Colors.red),
                  );
                }
                //The user picked true.
                // questionNumber++;
                print(quizBrain.questionNumber);
                quizBrain.nextQuestion();
                setState(() {});
              },
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                //The user picked false.
                if (quizBrain.getQuestionAnswer(quizBrain.questionNumber) ==
                    false) {
                  print('correct anser');
                  scorekeeper.add(
                    const Icon(Icons.check, color: Colors.green),
                  );
                } else {
                  print('wrong answer');
                  scorekeeper.add(
                    const Icon(Icons.close, color: Colors.red),
                  );
                }
                // questionNumber++;

                print(quizBrain.questionNumber);
                quizBrain.nextQuestion();
                setState(() {});
              },
              child: Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children: scorekeeper),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

/* const Icon(Icons.check, color: Colors.red),
    const Icon(Icons.check, color: Colors.green),
    const Icon(Icons.check, color: Colors.red),
    const Icon(Icons.check, color: Colors.red),
    const Icon(Icons.check, color: Colors.red),
    */
