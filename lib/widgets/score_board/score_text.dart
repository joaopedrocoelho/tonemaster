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
              Text(score.remainingQuestions.toString(), style: TextStyle(color: Colors.grey, fontSize: 20),),
              SizedBox(width: 5,),
              Text(score.correct.toString(), style: TextStyle(color: Colors.green, fontSize: 20),),
              SizedBox(width: 5,),
              Text(score.wrong.toString(), style: TextStyle(color: Colors.red, fontSize: 20),),
            ],)
          ],
        ),
      );
      }
    );
  }
}