import 'package:flutter/material.dart';
import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/play_word.dart';
import 'package:frontend/widgets/tone_buttons/buttons_container.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';

import 'package:frontend/widgets/display_word/display_word.dart';
import 'package:frontend/widgets/gradient_bug.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  List<PlayWord> _playWords = [];
  int _random = 0;

  void _newRandom() {
    setState(() {
      _random = Random().nextInt(_playWords.length);
    });
  }

  // Fetch content from the json file , has to be passed to a provider later
  Future<void> readJson() async {
    List<PlayWord> _tempWordList = [];
    final String response =
        await rootBundle.loadString('assets/json/HSK1_dict.json');
    final List<dynamic> data = await jsonDecode(response);
    data.forEach((word) {
      Word _newWord = Word.fromJson(word);
      PlayWord _newPlayWord = PlayWord.fromWord(_newWord);
       _tempWordList.add(_newPlayWord);
    });
   
    setState(() {
      _playWords = _tempWordList;
       _random = Random().nextInt(_playWords.length);
    });

  }

  @override
  void initState() {
    readJson();
    
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         if(_playWords.isNotEmpty)
          DisplayWord(word: _playWords[_random]),
          ButtonsContainer()
        ],
      ),
    );
  }
}
