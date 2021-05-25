import 'package:quiz_app/question.dart';

class QuizBrain{

  int _number=0;

  List<Question> _questionBank=[

    Question(q:'Flutter is a Cross Platform.',a:true),
    Question(q:'Flutter use Dart Language.',a:true),
    Question(q:'Flutter use ARM to compile.',a:true),
  ];

  void nextQuestion(){
    if(_number<_questionBank.length-1){
      _number++;
    }
    print("After: $_number");
  }

  String getQuestion(){
    return _questionBank[_number].questionText;
  }

  bool getAnswer(){
    return _questionBank[_number].questionAnswer;
  }

}