import 'package:flutter/material.dart';
import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/providers/score.dart';
import 'package:frontend/widgets/score_board/score_pie_chart.dart';
import 'package:frontend/widgets/tone_buttons/buttons_container.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';

import 'package:frontend/widgets/display_word/display_word.dart';
import 'package:provider/provider.dart';


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
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Score(),),
    ],
    builder: (context, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: Icon(Icons.menu,color: Colors.black,),
          title:Text("1/10", style: TextStyle(color: Colors.black, fontSize: 30),),
          actions: [
            ScorePieChart()
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
    );
  }
}
