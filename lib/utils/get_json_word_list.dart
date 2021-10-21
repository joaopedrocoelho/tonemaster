import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:flutter/services.dart';
import "dart:convert";


 
 Future<List<PlayWord>> getJsonWordList(String file) async {
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
    return _tempWordList;
    }