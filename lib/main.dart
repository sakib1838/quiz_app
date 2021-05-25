import 'package:flutter/material.dart';
import 'package:quiz_app/quizbrain.dart';
QuizBrain quizBrain = new QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.blue,
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool choosedAnswer){

    bool ans = quizBrain.getAnswer();

    setState(() {
      quizBrain.nextQuestion();
      if(choosedAnswer==true){
        print('Correct');
      }
      else{
        print('Wrong');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  quizBrain.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            )
        ),

        Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: (){
                  checkAnswer(false);
                },
              ),
            )
        ),

        Row(
          children: scoreKeeper,
        )

      ],
    );
  }
}


