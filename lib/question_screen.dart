import 'package:flutter/material.dart';
import 'package:qsa/answer_button.dart';
import 'package:qsa/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // int questioncount = 0;
  // var currentQuestion;
  int questioncount = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   currentQuestion = questions[questioncount];
  //   super.initState();
  // }
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questioncount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[questioncount];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentQuestion.text,
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 201, 153, 251),
              fontSize: 24,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        ...currentQuestion.getShuffledAnswers().map((answer) {
          return Container(
            margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnswerButton(answer, () {
                  answerQuestion(answer);
                }),
                const SizedBox(
                  
                  height: 20,
                )
              ],
            ),
          );
        })
      ],
    );
  }
}
