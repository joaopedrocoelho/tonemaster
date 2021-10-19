import 'package:fl_chart/fl_chart.dart';
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
    return Container(
      width: 50,
      height: 50,
      child: PieChart(
        PieChartData(
          //add total questions left
          sections: [
          if(context.watch<Score>().correct >0)  
            PieChartSectionData(
            value: context.watch<Score>().correct.toDouble(), //,
            color: Colors.green,
            radius: 12,
            showTitle: false,
          ),
          if(context.watch<Score>().wrong >0)
          PieChartSectionData(
            value: context.watch<Score>().wrong.toDouble(),//,
            color: Colors.red,
            radius: 12,
             showTitle: false,
          ),
           PieChartSectionData(
            value: context.watch<Score>().remainingQuestions.toDouble(),
            color: Colors.grey,
            radius: 12,
             showTitle: false,
          )]
        )
      )
      ,
    );
  }
}