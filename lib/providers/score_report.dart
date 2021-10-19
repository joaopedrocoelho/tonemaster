import 'package:flutter/cupertino.dart';
import 'package:frontend/models/score_report/word_report.dart';

class ScoreReport extends ChangeNotifier {
  List<WordReport> answeredWords =[];
  
  void add(WordReport answeredWord) {
    answeredWords.add(answeredWord);
    notifyListeners();
  }
  }