import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:flutter/services.dart';
import "dart:convert";


 
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