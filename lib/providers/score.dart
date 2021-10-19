import 'package:flutter/cupertino.dart';

class Score extends ChangeNotifier {
  int correct = 0;
  int wrong = 0;
  int totalQuestions;
  late int remainingQuestions;

  Score(this.totalQuestions) {
    this.remainingQuestions = this.totalQuestions;
  }


  
  void incrementCorrect() {
    correct++;
    notifyListeners();
  }

  void incrementWrong() {
    wrong++;
     notifyListeners();
  }

  void setTotalQuestions(int value) {
    totalQuestions = value;
  }

  void decrementRemaining() {
    remainingQuestions--;
  }
}