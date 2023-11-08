import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuizEvent, {super.key});

  final void Function() startQuizEvent;

  void startQuiz() {
    startQuizEvent();
  }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 41, 10, 95),
            Colors.deepPurple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: const Color.fromARGB(181, 255, 255, 255),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Learn Flutter the fun way',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: startQuiz,
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: Colors.transparent,
              // ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.ads_click_rounded),
              label: const Text(
                'Start Quiz',
              ),
            )
          ],
        ),
      ),
    );
  }
}
