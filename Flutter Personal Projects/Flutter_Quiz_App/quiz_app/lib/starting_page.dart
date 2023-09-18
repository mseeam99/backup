import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartingPage extends StatelessWidget {
  StartingPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  var welcome = 'assets/images/quiz-logo.png';

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          welcome,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        const Text(
          'Test your Flutter knowledge !',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.normal,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              minimumSize: const Size(350, 50)),
          onPressed: () {
            startQuiz();
          },
          icon: const Icon(Icons.menu_book_sharp),
          label: const Text(
            'Start Quiz..... ',
          ),
        ),
      ],
    );
  }
}
