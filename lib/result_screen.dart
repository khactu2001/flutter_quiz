import 'package:flutter/material.dart';
import 'package:flutter_2/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaries() {
    final List<Map<String, Object>> summaries = [];
    for (var i = 0; i < chosenAnswers.length - 1; i++) {
      summaries.add({
        'user_answer': chosenAnswers[i],
        'question_index': i,
        'correct_answer': questions[i].answers[0],
      });
    }
    print('The value of myNumber is: $summaries');
    return summaries;
  }

  List<Widget> summaries = [];

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You answered 3 out of 6 questions correctly!',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 30,
              child: Column(),
            ),
            getSummaries().map((item) => {
              return 'haha'
            }),
            const SizedBox(
              height: 30,
              child: Column(),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('restart quiz'),
            )
          ],
        ),
      ),
    );
  }
}
