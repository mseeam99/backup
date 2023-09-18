// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_project/changing_picture.dart';

class ContainerGradient extends StatelessWidget {
  const ContainerGradient(this.start, this.end, this.colorsList, {super.key});

  final Alignment start;
  final Alignment end;
  final List<Color> colorsList;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorsList,
          begin: start,
          end: end,
        ),
      ),
      child: const Center(
        child: ChangePicture(),
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
