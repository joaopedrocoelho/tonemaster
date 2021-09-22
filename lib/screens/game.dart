import 'package:flutter/material.dart';
import 'package:frontend/models/word_json.dart';
import 'package:frontend/widgets/buttons/buttons_container.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:frontend/widgets/display_word/display_word.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Word> _words = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/HSK1_dict.json');
    final List<dynamic> data = await jsonDecode(response);
        data.forEach((word) {
         Word newWord = Word.fromJson(word);
        setState(() {
          _words.add(newWord);
    });
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
            DisplayWord(),
            ButtonsContainer()
          ],
        ),
      
    );
  }
}