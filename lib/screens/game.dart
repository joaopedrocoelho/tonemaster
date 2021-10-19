import 'package:flutter/material.dart';
import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/providers/quiz_data.dart';
import 'package:frontend/providers/score.dart';
import 'package:frontend/providers/score_report.dart';
import 'package:frontend/widgets/display_word/display_character.dart';
import 'package:frontend/widgets/score_board/score_pie_chart.dart';
import 'package:frontend/widgets/score_board/score_text.dart';
import 'package:frontend/widgets/tone_buttons/buttons_container.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';
import "package:frontend/utils/indexed_iterables.dart";

import 'package:frontend/widgets/display_word/display_word.dart';
import 'package:provider/provider.dart';


class GameScreen extends StatefulWidget {
  final List<PlayWord> words;
  final int numberOfQuestions;
  GameScreen({Key? key, required this.words, required this.numberOfQuestions}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  List<PlayWord> _playWords = [];
 


  @override
  void initState() {
    widget.words.shuffle();
    _playWords = widget.words.sublist(0, widget.numberOfQuestions);
    print("_playWords.length ${_playWords.length}");
         
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Score(widget.numberOfQuestions)),
      ChangeNotifierProvider(create: (context) => QuizData(_playWords)),
      ChangeNotifierProvider(create: (context) => ScoreReport())
    ],
    builder: (context, child) {
      final quizData = context.watch<QuizData>();
     final PlayWord word = quizData.activeWord;

      List<DisplayCharacter> _characters = [];
            
      word.characters.forEachIndexed((character, index) {
      _characters.add(DisplayCharacter(
          character: character.traditional, tone: character.tone, id: index));
    });

    
    

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: Icon(Icons.menu,color: Colors.black,),
          title:Text("1/10", style: TextStyle(color: Colors.black, fontSize: 30),),
          actions: [
            ScoreText(),
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
              DisplayWord(characters: _characters,),
              ButtonsContainer()
            ],
          ),
        ),
      );
    }
    );
  }
}
