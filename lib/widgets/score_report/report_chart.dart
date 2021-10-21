import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportChart extends StatelessWidget {
  final int correct;
  final int wrong;
  final int totalQuestions;
  const ReportChart({
    required this.correct,
    required this.wrong,
    required this.totalQuestions,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int percentage = ((correct / totalQuestions) * 100).ceil();

    return Column(
      children: [
         Container(
      width: MediaQuery.of(context).size.width/2.5,
      height: MediaQuery.of(context).size.width/2.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          
          Text("${percentage.toString()}%",
          style:  TextStyle(fontSize: MediaQuery.of(context).size.width/15, color: Colors.black,
          fontWeight: FontWeight.bold),),

          PieChart(
          PieChartData(
            //add total questions left
            sections: [
            
              PieChartSectionData(
              value: correct.toDouble(), //,
              color: Colors.green,
              radius: 30,
              showTitle: false,
            ),
              PieChartSectionData(
              value: wrong.toDouble(),//,
              color: Colors.red,
              radius: 30,
               showTitle: false,
            )]
          )
        )
        ],
      )
      ,
    ),
    SizedBox(height:10),
    Text(
      "$correct out of $totalQuestions",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    )
      ],
    );
  }
}