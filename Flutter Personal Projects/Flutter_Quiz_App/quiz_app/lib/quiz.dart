import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/starting_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> answerList = [];

  void answerToListFunctionQuizFile(String answerParam) {
    answerList.add(answerParam);

    if (actual_questions.length == answerList.length) {
      setState(() {
        activeScreen = 'result_page';
      });
    }
  }

  var activeScreen = 'starting_page';

  void changeScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void restartQuiz() {
    setState(() {
      answerList = [];
      activeScreen = 'starting_page';
    });
  }

  @override
  Widget build(context) {
    Widget finalScreen = StartingPage(changeScreen);
    if (activeScreen == 'starting_page') {
      finalScreen = StartingPage(changeScreen);
    } else if (activeScreen == 'question_screen') {
      finalScreen = QuestionScreen(
        onSelectAnswer: answerToListFunctionQuizFile,
      );
    } else if (activeScreen == 'result_page') {
      finalScreen = ResultScreen(
        choosenAnswers: answerList,
        restartQuizFunction: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.white10],
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,
            ),
          ),
          child: finalScreen,
        ),
      ),
    );
  }
}
