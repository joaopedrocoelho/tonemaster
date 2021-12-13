import 'package:flutter/material.dart';
import 'package:frontend/providers/user_settings.dart';
import 'package:frontend/screens/game.dart';
import 'package:frontend/utils/get_json_word_list.dart';


void pushToScreen(String file, BuildContext context, [int? slice]) {
      getJsonWordList(file, slice).then(
        (list) => Navigator.push(context, MaterialPageRoute(
          maintainState: false,
          builder: (context) {
            int? numberOfWords;
            if(UserSettings.getQuizSize() != null) {
              UserSettings.getQuizSize()! > list.length ? 
                numberOfWords = list.length : numberOfWords = UserSettings.getQuizSize()!;
            } else {
              numberOfWords = list.length > 5 ? 5 : list.length;
            }
              return GameScreen(words: list, numberOfWords: numberOfWords,);
            })));
  }