import 'package:flutter/material.dart';
import 'package:frontend/providers/score.dart';
import 'package:provider/provider.dart';

class ScoreText extends StatefulWidget {
  ScoreText({Key? key}) : super(key: key);

  @override
  _ScoreTextState createState() => _ScoreTextState();
}

class _ScoreTextState extends State<ScoreText> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
   
    return Consumer<Score>(
      builder: (context, score, child) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(score.remainingQuestions.toString(), style:
               TextStyle(
                color: theme.shadowColor, fontSize: 25,
                fontWeight: FontWeight.w600,
              fontFamily: 'SignikaNegative',),),
              SizedBox(width: 5,),
              Text(score.correct.toString(), style:
               TextStyle(
                color: theme.splashColor, fontSize: 25,
                fontWeight: FontWeight.w600,
              fontFamily: 'SignikaNegative',),),
              SizedBox(width: 5,),
              Text(score.wrong.toString(), style: 
              TextStyle(
                color: theme.highlightColor, fontSize: 25,
                fontWeight: FontWeight.w600,
              fontFamily: 'SignikaNegative',),),
            ],)
          ],
        ),
      );
      }
    );
  }
}