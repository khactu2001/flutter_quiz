import 'package:flutter/material.dart';
// import 'package:flutter_2/data/questions.dart';

class QuestionSummaries extends StatelessWidget {
  const QuestionSummaries({super.key, required this.summaries});

  final List<Map<String, Object>> summaries;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaries.map((item) {
            bool isAnswerCorrect = false;
            if (item['user_answer'] == item['correct_answer']) {
              isAnswerCorrect = true;
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isAnswerCorrect ? Colors.white : Colors.red,
                    ),
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 20),
                    child: Center(
                      child: Text(
                        (((item['question_index']) as int) + 1).toString(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          item['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(143, 255, 255, 255),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          item['correct_answer'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
