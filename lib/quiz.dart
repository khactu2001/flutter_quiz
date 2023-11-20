import 'package:flutter/material.dart';
import 'package:flutter_2/data/questions.dart';
import 'package:flutter_2/start_screen.dart';
import 'package:flutter_2/question_screen.dart';
import 'package:flutter_2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = 'start-screen';
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onTapAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget currentScreenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      currentScreenWidget = Question(onSelectAnswer: onTapAnswer);
    } else if (activeScreen == 'result-screen') {
      currentScreenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: () {
          setState(() {
            selectedAnswers = [];
            activeScreen = 'question-screen';
          });
        },
      );
    }

    // currentScreenWidget = ResultScreen();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          child: currentScreenWidget,
        ),
      ),
    );
  }
}
