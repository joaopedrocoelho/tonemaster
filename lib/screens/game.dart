import 'package:flutter/material.dart';
import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/providers/ad_state.dart';
import 'package:frontend/providers/quiz_data.dart';
import 'package:frontend/providers/score.dart';
import 'package:frontend/providers/score_report.dart';
import 'package:frontend/providers/user_settings.dart';
import 'package:frontend/widgets/display_word/display_character.dart';
import 'package:frontend/widgets/score_board/score_pie_chart.dart';
import 'package:frontend/widgets/score_board/score_text.dart';
import 'package:frontend/widgets/tone_buttons/buttons_container.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';
import "package:frontend/utils/indexed_iterables.dart";

import 'package:frontend/widgets/display_word/display_word.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  final List<PlayWord> words;
  final int numberOfWords;
  GameScreen({Key? key, required this.words, required this.numberOfWords})
      : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<PlayWord> _playWords = [];
  int _totalQuestions = 0;
  late bool _useTraditional;

  final BannerAd bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.fluid,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {},
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ));

  bool _isAdLoaded = false;

  void _loadAd() {
    
    setState(() {
      _isAdLoaded = true;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _useTraditional = UserSettings.getCharacters() ?? false;
    widget.words.shuffle();
    _playWords = widget.words.sublist(0, widget.numberOfWords);
    _playWords.forEach((word) {
      _totalQuestions += word.characters.length;
    });
    bannerAd.load();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Score(_totalQuestions)),
          ChangeNotifierProvider(create: (context) => QuizData(_playWords)),
          ChangeNotifierProvider(create: (context) => ScoreReport())
        ],
        builder: (context, child) {
          final quizData = context.watch<QuizData>();
          final PlayWord word = quizData.activeWord;
          final int _totalWords = quizData.size; 

          List<DisplayCharacter> _characters = [];

          word.characters.forEachIndexed((character, index) {
            _characters.add(DisplayCharacter(
                character: _useTraditional ? character.traditional : character.simplified,
                tone: character.tone,
                id: index));
          });

          return Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: theme.appBarTheme.backgroundColor,
        shadowColor: theme.appBarTheme.shadowColor,
              leading:
                  Icon(Icons.menu_rounded, color: theme.shadowColor, size: 40),
              title: Text(
                "${quizData.wordsAnswered}/$_totalWords",
                style: TextStyle(color: theme.shadowColor, fontSize: 30),
              ),
              actions: [ScoreText(), ScorePieChart()],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                      height: 50,
                      
      child: AdWidget(ad: bannerAd),
    ),
                  if (widget.words.isNotEmpty)
                    DisplayWord(
                      characters: _characters,
                    ),
                  ButtonsContainer()
                ],
              ),
            ),
          );
        });
  }
}
