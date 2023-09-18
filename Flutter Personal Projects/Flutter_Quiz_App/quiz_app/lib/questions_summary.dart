import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  get crossAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['correct_answer'] == data['user_answer']
                          ? Colors.greenAccent
                          : Colors.red,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '${(data['question_index'] as int) + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Your answer: ${data['user_answer']}',
                          style: TextStyle(
                            color: data['correct_answer'] == data['user_answer']
                                ? Colors.greenAccent
                                : Colors.red,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Correct answer : ${data['correct_answer']}',
                          style: const TextStyle(
                              color: Colors.greenAccent, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
