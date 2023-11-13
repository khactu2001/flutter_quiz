import 'package:flutter/material.dart';
// import 'package:flutter_2/data/questions.dart';

class QuestionSummaries extends StatelessWidget {
  const QuestionSummaries({super.key, required this.summaries});

  final List<Map<String, Object>> summaries;

  @override
  Widget build(context) {
    return Column(
      children: summaries.map((item) {
        return Row(
          children: [
            Text(
              (((item['question_index']) as int) + 1).toString(),
              style: TextStyle(
                backgroundColor: Colors.grey,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    item['question'] as String,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    item['user_answer'] as String,
                    style: TextStyle(
                      color: const Color.fromARGB(143, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    item['correct_answer'] as String,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
