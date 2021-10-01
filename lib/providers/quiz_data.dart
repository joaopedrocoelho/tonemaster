
import 'dart:math';

import 'package:frontend/models/words/play_character.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:flutter/material.dart';

class QuizData extends ChangeNotifier {
  List<PlayWord> _words = [];
  PlayWord _activeWord = PlayWord(
      characters: [PlayCharacter(simplified: "null", traditional: "null", tone: 4)]);
  PlayCharacter _activeCharacter =
      PlayCharacter(simplified: "null", traditional: "null", tone: 4);

  get words => _words;
  get activeWord => _activeWord;
  get activeCharacter => _activeCharacter;

  bool checkIfAnswerIsCorrect(int tone) {
    bool _isCorrect =
    (_activeCharacter.tone == tone) ? true :  false;
            return _isCorrect;
      }    

  int renderWord() {
     int _random = Random().nextInt(_words.length);
    if(_activeWord.characters[0].simplified == "null") {
        _activeWord = _words[_random];
        _activeCharacter = _activeWord.characters[0];
        notifyListeners();
    } else {
        _words.remove(_activeWord); //returns a boolean
        _activeWord = _words[_random];
        _activeCharacter = _activeWord.characters[0];
        notifyListeners();
    }
    
     return _random;
  }
}
