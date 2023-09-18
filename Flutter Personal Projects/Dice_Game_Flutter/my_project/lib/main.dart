import 'package:flutter/material.dart';
import 'package:my_project/container_gradient.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: ContainerGradient(
          Alignment.bottomRight,
          Alignment.topCenter,
          [Colors.black, Colors.white10],
        ),
      ),
    ),
  );
}
