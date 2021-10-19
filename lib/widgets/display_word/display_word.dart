import 'package:flutter/material.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/providers/quiz_data.dart';
import 'package:frontend/utils/get_char_list.dart';

import "package:frontend/utils/indexed_iterables.dart";
import 'package:frontend/widgets/display_word/display_character.dart';
import 'package:provider/provider.dart';

class DisplayWord extends StatefulWidget {
  //final PlayWord word;
  final List<DisplayCharacter> characters;
  DisplayWord({Key? key, required this.characters}) : super(key: key);

  @override
  _DisplayWordState createState() => _DisplayWordState();
}

class _DisplayWordState extends State<DisplayWord> {
  List<DisplayCharacter> _characters = [];

  @override
  void initState() {
    // TODO: implement simplifiedCharacterList
   /*  widget.word.characters.forEachIndexed((character, index) {
      _characters.add(DisplayCharacter(
          character: character.traditional, tone: character.tone, id: index));
    }); */
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizData>(builder: (context, quizData, child) {
      return Expanded(
        child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                   child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: widget.characters,
                ),
              ),
            )),
      );
    });
  }
}
