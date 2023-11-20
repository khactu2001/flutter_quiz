import 'package:flutter/material.dart';
import 'package:flutter_2/data/questions.dart';
import 'package:flutter_2/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaries() {
    final List<Map<String, Object>> summaries = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summaries.add({
        'user_answer': chosenAnswers[i],
        'question_index': i,
        'correct_answer': questions[i].answers[0],
        'question': questions[i].question,
      });
    }
    return summaries;
  }

  // List<Widget> summaries = [];

  @override
  Widget build(context) {
    final summaries = getSummaries();
    final totalQuestions = summaries.length;
    final numberCorrectAnswers = summaries
        .where(
          (item) => item['user_answer'] == item['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberCorrectAnswers out of $totalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummaries(
              summaries: summaries,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: restartQuiz,
              child: const Text('restart quiz'),
            )
          ],
        ),
      ),
    );
  }
}
