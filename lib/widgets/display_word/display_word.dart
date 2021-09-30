import 'package:flutter/material.dart';
import 'package:frontend/models/play_word.dart';
import 'package:frontend/utils/get_char_list.dart';

import "package:frontend/utils/indexed_iterables.dart";
import 'package:frontend/widgets/display_word/display_character.dart';

class DisplayWord extends StatefulWidget {
  final PlayWord word;
  DisplayWord({Key? key, required this.word}) : super(key: key);

  @override
  _DisplayWordState createState() => _DisplayWordState();
}

class _DisplayWordState extends State<DisplayWord> {
  List<DisplayCharacter> _characters = [];

  @override
  void initState() {
    // TODO: implement simplifiedCharacterList
    widget.word.characters.forEachIndexed((character, index) {
      _characters.add(DisplayCharacter(
          character: character.traditional, tone: character.tone, id: index));
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
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: _characters,
            ),
          ),
        ));
  }
}
