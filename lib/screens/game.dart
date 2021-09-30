import 'package:flutter/material.dart';
import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/play_word.dart';
import 'package:frontend/widgets/tone_buttons/buttons_container.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';

import 'package:frontend/widgets/display_word/display_word.dart';


class GameScreen extends StatefulWidget {
  final List<PlayWord> words;
  GameScreen({Key? key, required this.words}) : super(key: key);

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
  Future<void> readJson(String file) async {
    List<PlayWord> _tempWordList = [];
    final String response =
        await rootBundle.loadString(file);
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
      print(widget.words);
    
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu_outlined,
        ),
        title: Text('Tone Master'),
        actions: [
          Icon(
            Icons.settings_outlined,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           if(widget.words.isNotEmpty)
            DisplayWord(word: widget.words[_random]),
            ButtonsContainer()
          ],
        ),
      ),
    );
  }
}
