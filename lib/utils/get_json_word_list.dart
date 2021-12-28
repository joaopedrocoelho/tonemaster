import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:flutter/services.dart';
import "dart:convert";
import "dart:math";
import 'package:frontend/utils/indexed_iterables.dart';


 
 Future<List<PlayWord>> getJsonWordList(String file, [int? slice]) async {
    List<PlayWord> _tempWordList = [];
    final String response =
        await rootBundle.loadString(file);
    final List<dynamic> data = await jsonDecode(response);
    
    data.forEach((word) {
      //print(word['traditional']);
      Word _newWord = Word.fromJson(word);
      PlayWord _newPlayWord = PlayWord.fromWord(_newWord);
          _tempWordList.add(_newPlayWord);
    });
    //print("words $_tempWordList");
    
   
    if (slice != null) {
      
     return slice <= _tempWordList.length -1 ? _tempWordList.sublist(0,slice) : _tempWordList.sublist(0,_tempWordList.length -1);
    }
    return _tempWordList;
    }

Future<List<PlayWord>> newGetJsonWordList(String file, int quizSize) async {
    List<PlayWord> _tempWordList = [];
    final String response =
        await rootBundle.loadString(file);
    final List<dynamic> data = await jsonDecode(response);

    int _randomNumber = new Random().nextInt(data.length - quizSize);
    if (_randomNumber < quizSize) _randomNumber += quizSize;
    data.forEachIndexed((word, index) {
        if(index >= _randomNumber &&  index <= _randomNumber+quizSize) {
          
          Word _newWord = Word.fromJson(word);
      PlayWord _newPlayWord = PlayWord.fromWord(_newWord);
          _tempWordList.add(_newPlayWord);
    }
    });

    return _tempWordList;
}