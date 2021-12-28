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
    var theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
        "$correct correct out of $totalQuestions",
        style: TextStyle(
          fontSize: 20,
          color: theme.shadowColor,
            fontFamily: 'SignikaNegative',
          fontWeight: FontWeight.w600
        ),
        
      ),
      SizedBox(height: 10),
           Container(
        width: MediaQuery.of(context).size.width/2.5,
        height: MediaQuery.of(context).size.width/2.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            Text("${percentage.toString()}%",
            style:  TextStyle(fontSize: MediaQuery.of(context).size.width/15, 
            color: theme.shadowColor,
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w600),),

            PieChart(
            PieChartData(
              //add total questions left
              sections: [
              
                PieChartSectionData(
                value: correct.toDouble(), //,
                color: theme.indicatorColor,
                radius: 30,
                showTitle: false,
              ),
                PieChartSectionData(
                value: wrong.toDouble(),//,
                color: theme.hintColor,
                radius: 30,
                 showTitle: false,
              )]
            )
          )
          ],
        )
        ,
      ),
      
      
        ],
      ),
    );
  }
}