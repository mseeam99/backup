import 'package:flutter/material.dart';

const List<String> list = <String>[
  "WORKOUT",
  "TENNIS",
  "SOCCER",
  "FOOTBALL",
  "GROUP STUDY",
  "COFFEE",
  "WALK",
  "BE WEIRD",
];

class MyActivity extends StatefulWidget {
  final ValueChanged<String> onActivitySelected;
  const MyActivity({Key? key, required this.onActivitySelected})
      : super(key: key);

  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
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
            widget.onActivitySelected(dropdownValue);
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
