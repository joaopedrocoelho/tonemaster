import 'package:flutter/material.dart';
import 'package:frontend/providers/user_settings.dart';
import 'package:frontend/screens/game.dart';
import 'package:frontend/utils/get_json_word_list.dart';


void pushToScreen(String file, BuildContext context) {
      getJsonWordList(file).then(
        (list) => Navigator.push(context, MaterialPageRoute(
          maintainState: false,
          builder: (context) {
              return GameScreen(words: list, numberOfWords: UserSettings.getQuizSize() ?? 5,);
            })));
  }