import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/models/word_json.dart';
import 'package:frontend/widgets/buttons/buttons_container.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DisplayWord extends StatefulWidget {
  DisplayWord({Key? key}) : super(key: key);

  @override
  _DisplayWordState createState() => _DisplayWordState();
}

class _DisplayWordState extends State<DisplayWord> {
  List<Word> _words = [];
  int? _random;

  void _newRandom() {
    setState(() {
      _random = Random().nextInt(_words.length);
    });
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/HSK1_dict.json');
    final List<dynamic> data = await jsonDecode(response);
    data.forEach((word) {
      Word newWord = Word.fromJson(word);
      setState(() {
        _words.add(newWord);
        _random = Random().nextInt(_words.length);
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
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: GestureDetector(
            onTap: _newRandom,
            child: Material(
                child: Text(
              _random != null ? _words[_random!].traditional : '',
              style: TextStyle(fontSize: 100, color: Colors.black),
            ))),
      ),
    );
  }
}
