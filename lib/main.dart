import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app2/question.dart';

void main() => runApp(Quiz());

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionIndex = 0;
  String answer = "";
  List<Question> questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: Scaffold(
        backgroundColor: Colors.white10,
        body: Column(
          children: [
            Container(
              height: 600,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "Question #${questionIndex + 1}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Text(
                      questionBank[questionIndex].questions,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Your previous answer was " + answer,
                        style: TextStyle(
                          color:
                              answer == "Correct !" ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        color: Colors.green,
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "True",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (questionBank[questionIndex].answer == true) {
                          setState(() {
                            answer = "Correct !";
                            questionIndex++;
                            questionIndex = questionIndex % questionBank.length;
                          });
                        } else {
                          setState(() {
                            answer = "Wrong !";
                            questionIndex++;
                            questionIndex = questionIndex % questionBank.length;
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        child: Container(
                          color: Colors.red,
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "False",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (questionBank[questionIndex].answer == false) {
                            setState(() {
                              answer = "Correct !";
                              questionIndex++;
                              questionIndex =
                                  questionIndex % questionBank.length;
                            });
                          } else {
                            setState(() {
                              answer = "Wrong !";
                              questionIndex++;
                              questionIndex =
                                  questionIndex % questionBank.length;
                            });
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
