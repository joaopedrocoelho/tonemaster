import 'package:flutter/material.dart';
import 'package:frontend/utils/answer_to_pinyin.dart';
import 'package:frontend/utils/compare_answers.dart';
import 'package:frontend/utils/pinyin_convert_tool.dart';

class WordReportRow extends StatelessWidget {
  final String word;
  final List<int> userAnswer;
  final String correctAnswer;
  const WordReportRow(
      {required this.word,
      required this.userAnswer,
      required this.correctAnswer,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    String userAnswerConverted =
        convertToPinyin(convertUserAnswerToPinyin(userAnswer, correctAnswer));
    String correctAnswerConverted = convertToPinyin(correctAnswer);
    //   print("userAnswerConverted $userAnswerConverted, ${userAnswerConverted.length}");
    // print("correctAnswerConverted $correctAnswerConverted, ${correctAnswerConverted.length}");
    bool isCorrect =
        compareAnswers(userAnswerConverted, correctAnswerConverted);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: Center(
            child: Text(
              word,
              style: TextStyle(
                  fontSize: 30,
                  color: isCorrect ? theme.splashColor : Colors.red),
            ),
          ),
        ),
        Container(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("your answer",
                  style: TextStyle(
                      fontSize: 14,
                      color: theme.shadowColor,
                      fontFamily: 'SignikaNegative',
                      fontWeight: FontWeight.w600)),
              Text(userAnswerConverted,
                  style: TextStyle(
                      fontSize: 18,
                      color: isCorrect ? theme.splashColor : Colors.red,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w600))
            ],
          ),
        ),
        Container(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("correct answer",
                  style: TextStyle(
                      fontSize: 14,
                      color: theme.shadowColor,
                      fontFamily: 'SignikaNegative',
                      fontWeight: FontWeight.w600)),
              Text(correctAnswerConverted,
                  style: TextStyle(
                      fontSize: 18,
                      color: theme.primaryColorLight,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w600))
            ],
          ),
        )
      ],
    );
  }
}
/* 
List<Text> compareAnswers(String userAnswer, String correctAnswer) {
  //if the answer differs then split the syllable and return a red Text with it
  List<String> userArr = userAnswer.split('');
  List<String> correctArr = correctAnswer.split('');
  int splitIndex = 0;
  List<Text> comparison = [];

  for (int i =0; i < userArr.length; i++) {
    if(userArr[i] != correctArr[i]) {
      comparison.add(
        Text(userArr.sublist(splitIndex, i+1).join(), style: TextStyle(
          color: Colors.red
        ),)
      );
      splitIndex = i;
      }
    
  }
  //else return a blueText

  return comparison;
} */