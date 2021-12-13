import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:frontend/providers/quiz_data.dart';
import 'package:frontend/widgets/display_word/active_character/triangle.dart';
import 'package:provider/provider.dart';

class DisplayCharacter extends StatefulWidget {
  final String character;
  final int tone;
  final int id;


  const DisplayCharacter({
    Key? key,
    required this.character,
    required this.id,
    required this.tone,
  }) : super(key: key);

  @override
  _DisplayCharacterState createState() => _DisplayCharacterState();
}

class _DisplayCharacterState extends State<DisplayCharacter> {
  


  @override
  void initState() {
   
     super.initState();
  }


  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Consumer<QuizData>(builder: (context, quizData, child) {
      return Container(
        //color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
         
          children: [
            if (widget.id == quizData.activeIndex) Triangle(),
            Text(widget.character,
                style: TextStyle(
                    fontSize: 100,
                    color: widget.id == quizData.activeIndex
                        ? theme.focusColor
                        : theme.canvasColor),
                        ),
          ],
        ),
      );
    });
  }
}
