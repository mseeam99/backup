// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

const List<String> list = <String>[
  "Texas Tech University (TTU)",
  "Rice University",
  "Baylor University",
  "University of Texas at Austin",
  "University of Texas at Arlington",
  "Texas A&M University",
  "Texas State University",
  "Texas Christian University",
];

class CollegeDropdownButton extends StatefulWidget {
  final ValueChanged<String> onCollegeSelected;
  const CollegeDropdownButton({super.key, required this.onCollegeSelected});

  @override
  State<CollegeDropdownButton> createState() => _CollegeDropdownButtonState();
}

class _CollegeDropdownButtonState extends State<CollegeDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
            widget.onCollegeSelected(
                dropdownValue); // Call the callback to update myCollege
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
