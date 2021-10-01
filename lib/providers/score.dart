import 'package:flutter/cupertino.dart';

class Score extends ChangeNotifier {
  int _correct = 0;
  int _wrong = 0;

  int get correct => _correct;
  int get wrong => _wrong;
  
  void incrementCorrect() {
    _correct++;
    notifyListeners();
  }

  void incrementWrong() {
    _wrong++;
    notifyListeners();
  }
}