import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/models/word_json.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:frontend/widgets/display_word/display_character.dart';

class DisplayWord extends StatefulWidget {
  final String word;
  DisplayWord({Key? key, required this.word}) : super(key: key);

  @override
  _DisplayWordState createState() => _DisplayWordState();
}

class _DisplayWordState extends State<DisplayWord> {
  List<DisplayCharacter> _characters = [];
  
  @override
  void initState() {
    // TODO: implement initState
    List<String> _characterList = widget.word.split("");
    _characterList.forEach((char) {
      _characters.add(DisplayCharacter(character: char));
    });
    print(_characters);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: GestureDetector(
            onTap: () {},
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _characters,
            ),
      ),
    ));
  }
}
