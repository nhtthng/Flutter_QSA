import 'package:flutter/material.dart';
import 'package:qsa/data/questions.dart';
import 'package:qsa/start_screen.dart';
import "package:qsa/question_screen.dart";
import 'package:qsa/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget? activeScreen; // khi không để dấu ? thì nó yêu cầu phải có dữ liệu cho nó
  var activeScreen = "start_screen";
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen); // phải khai báo activeScreen trong này là để cho switchScreen được tải hoàn chỉnh, nếu ko sẽ có thể tải ko đủ
  //   super.initState();
  // }
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question_screen';
    });
  }
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "question_screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result-screen") {
      screenWidget =  ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[600],
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
