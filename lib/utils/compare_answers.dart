import 'package:flutter/material.dart';

bool compareAnswers(String userAnswer, String correctAnswer) {
  //if the answer differs then split the syllable and return a red Text with it
  List<String> userArr = userAnswer.split('');
  List<String> correctArr = correctAnswer.split('');
  bool isCorrect = true;

  for (int i =0; i < userArr.length; i++) {
    if(userArr[i] != correctArr[i]) {
        isCorrect = false;
        break;
      } 
    
  }
  //else return a blueText

  return isCorrect;
}


/* bool compareAnswersNew(String userAnswer, String correctAnswer) {
  //if the answer differs then split the syllable and return a red Text with it
  List<String> userArr = userAnswer.split(' ');
  List<String> correctArr = correctAnswer.split('');
  bool isCorrect = true;

  for (int i =0; i < userArr.length; i++) {
    if(userArr[i] != correctArr[i]) {
        isCorrect = false;
        break;
      } 
    
  }
  //else return a blueText

  return isCorrect;
}
 */