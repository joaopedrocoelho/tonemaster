import 'package:flutter/material.dart';

import 'package:frontend/models/words/play_word.dart';

import 'package:frontend/providers/quiz_data.dart';
import 'package:frontend/providers/score.dart';
import 'package:frontend/providers/score_report.dart';
import 'package:frontend/providers/user_settings.dart';
import 'package:frontend/widgets/display_word/display_character.dart';
import 'package:frontend/widgets/score_board/score_pie_chart.dart';
import 'package:frontend/widgets/score_board/score_text.dart';
import 'package:frontend/widgets/tone_buttons/buttons_container.dart';

import 'package:flutter/foundation.dart';
import "package:frontend/utils/indexed_iterables.dart";

import 'package:frontend/widgets/display_word/display_word.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

RegExp checkIfNotChinese = RegExp(r"[^\u4e00-\u9fff]");

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
      adUnitId: kDebugMode ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-5758087039130918/3967921821',
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
    
     String _charsFromPlayWords = _playWords[0].simplToString();
     print("\x1B[32mchars @ game screen _playWords : $_charsFromPlayWords  ${_playWords[0].characters.length}\x1B[0m");
    _playWords.forEach((word) {
    
      word.characters.forEach((character) { 
        if (checkIfNotChinese.hasMatch(character.simplified)) return;
        _totalQuestions++;
      });
      
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
          String _activeWordtoStr = '';
          word.characters.forEach((char) {
            _activeWordtoStr += char.simplified;
          });

          print("quizData.activeWord @ game screen widget ${_activeWordtoStr} ${quizData.activeWord.characters.length}");
          List<DisplayCharacter> _characters = [];

          word.characters.forEachIndexed((character, index) {
            _characters.add(DisplayCharacter(
                character: _useTraditional
                    ? character.traditional
                    : character.simplified,
                tone: character.tone,
                id: index,
                ));
          });

          return Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: theme.appBarTheme.backgroundColor,
              shadowColor: theme.appBarTheme.shadowColor,
              leading: RawMaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded, size: 30,
                ),
              ),
              title: Text(
                "${quizData.wordsAnswered}/$_totalWords",
                style: TextStyle(color: theme.shadowColor, fontSize: 30),
              ),
              actions: [ScoreText(), ScorePieChart()],
            ),
            body: Container(
              //rheight: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: AdWidget(ad: bannerAd),
                  ),
                  if (widget.words.isNotEmpty)
                    Expanded(
                      child: DisplayWord(
                        characters: _characters,
                      ),
                    ),
                  ButtonsContainer()
                ],
              ),
            ),
          );
        });
  }
}
