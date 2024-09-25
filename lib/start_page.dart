import 'package:flutter/material.dart';
import 'package:quizapp/question_model.dart';
import 'package:quizapp/questions.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int index = 0;

  void switchScreen() {
    index < 5
        ? setState(() {
            index++;
          })
        : print("end");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pink, Colors.purple])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
              color: Colors.lightBlueAccent,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              questions[0].questionText,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            ...answerWidgetList(questions: questions, index: index)
          ],
        ),
      ),
    );
  }

  List<Widget> answerWidgetList(
      {required List<Question> questions, required int index}) {
    List<Widget> widgetList = [];
    for (int i = 0; i < questions[i].answers.length; i++) {
      widgetList.add(OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: switchScreen,
          icon: const Icon(Icons.arrow_right_alt),
          label: Text(questions[index].answers[i],
              style: const TextStyle(
                color: Colors.black,
              ))));
    }
    return widgetList;
  }
}
