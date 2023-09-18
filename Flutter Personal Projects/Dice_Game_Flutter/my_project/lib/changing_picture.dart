import 'dart:math';

import 'package:flutter/material.dart';

class ChangePicture extends StatefulWidget {
  const ChangePicture({super.key});
  @override
  State<ChangePicture> createState() {
    return _ChangePictureState();
  }
}

class _ChangePictureState extends State<ChangePicture> {
  var activeDiceImage = 'assets/dice-images/dice-6.png';

  void changeImage() {
    var number = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = 'assets/dice-images/dice-$number.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
        ),
        TextButton(
          onPressed: changeImage,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Press to roll the dice !'),
        ),
      ],
    );
  }
}
