String convertUserAnswerToPinyin(List<int> userAnswer, String numerical) {
  List<String> split = numerical.split('');
  int answerIndex = 0;
  for (int i =0; i < split.length; i++) {
    if(RegExp(r'\d').hasMatch(split[i])) {
      split[i] = userAnswer[0].toString();
      userAnswer.removeAt(0);
        }
  }
  
  return split.join();
}