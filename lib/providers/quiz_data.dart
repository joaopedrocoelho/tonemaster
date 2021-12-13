import 'dart:math';

import 'package:frontend/models/words/play_character.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:flutter/material.dart';

RegExp checkIfNotChinese = RegExp(r"[^\u4e00-\u9fff]");

class QuizData extends ChangeNotifier {
  List<PlayWord> _words = [];
  PlayWord _activeWord = PlayWord(characters: [
    PlayCharacter(simplified: "null", traditional: "null", tone: 4)
  ], english: "null", pinyin: "null", pinyinTw: null, pinyinAccented: 'null');
  int _activeIndex = 0;
  PlayCharacter _activeCharacter =
      PlayCharacter(simplified: "null", traditional: "null", tone: 4);
  bool _gameOver = false;
  int wordsAnswered = 0;
  int size = 0;

  List<PlayWord> get words => _words;
  get activeWord => _activeWord;
  get activeCharacter => _activeCharacter;
  get gameOver => _gameOver;
  int get activeIndex => _activeIndex;

  set words(List<PlayWord> newWords) => this._words = newWords;
  set activeIndex(int newIndex) => this._activeIndex = newIndex;

  QuizData(this._words) {
    size = this._words.length;
    renderWord();
  }

  bool checkIfAnswerIsCorrect(int tone) {
    bool _isCorrect = (_activeCharacter.tone == tone) ? true : false;
    return _isCorrect;
  }

  int renderWord() {
    if (_activeWord.characters[0].simplified != "null" && _words.length > 0) {
      _activeIndex = 0;
      _words.remove(_activeWord);
      wordsAnswered++; //returns a boolean

    }

    int _random = _words.length > 0 ? Random().nextInt(_words.length) : 0;
    if (_words.length > 0) {
      _activeWord = _words[_random];
      _activeCharacter = _activeWord.characters[0];
    } else {
      endGame();
    }
    notifyListeners();
    return _random;
  }

  void renderNextCharacter() {
    if (_activeIndex < (_activeWord.characters.length - 1)) {
      //print("next character");
      _activeIndex++;
      _activeCharacter = _activeWord.characters[_activeIndex];

      notifyListeners();
    } else {
      //print("next word");
      renderWord();
    }
    if (checkIfNotChinese.hasMatch(_activeCharacter.simplified)) {
      renderNextCharacter();
    }
  }

  void endGame() {
    _gameOver = true;
  }
}
