class Questions {
  const Questions(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}

const actual_questions = [
  Questions(
    'Is Flutter Cross-platform ?',
    [
      'Yes',
      'No',
      'Maybe',
      'Flutter team is working on it',
    ],
  ),
  Questions(
    'Does Flutter has Hot Reloading ?',
    [
      'Yes',
      'No',
      'Sometimes',
      'Flutter team is working on it',
    ],
  ),
  Questions(
    'Which programming language does Flutter use ?',
    [
      'Dart',
      'Java',
      'C++',
      'Python',
    ],
  ),
  Questions(
    'Flutter is owned by _____ ',
    [
      'Google',
      'Facebook',
      'Oracle',
      'Cisco',
    ],
  ),
  Questions(
    'How many types of widgets are available ?',
    [
      'Two',
      'Three',
      'One',
      'No widgets',
    ],
  ),
  Questions(
    'Flutter/Dart is ___',
    [
      'Object Oriented Programming(OOP)',
      'Functional Programming (FP)',
      'Structural Programming (SP)',
      'Open Free Programming (OFP)',
    ],
  ),
];
