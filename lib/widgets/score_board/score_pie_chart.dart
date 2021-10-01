import 'package:flutter/material.dart';
import 'package:frontend/providers/score.dart';
import 'package:provider/provider.dart';

class ScorePieChart extends StatefulWidget {
  ScorePieChart({Key? key}) : super(key: key);

  @override
  _ScorePieChartState createState() => _ScorePieChartState();
}

class _ScorePieChartState extends State<ScorePieChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Score>(
      builder: (context, score, child) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO: implement Pie Chart
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(score.correct.toString(), style: TextStyle(color: Colors.green, fontSize: 30),),
              Text(score.wrong.toString(), style: TextStyle(color: Colors.red, fontSize: 30),),
            ],)
          ],
        ),
      );
      }
    );
  }
}