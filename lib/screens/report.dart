import 'package:flutter/material.dart';
import 'package:frontend/models/score_report/word_report.dart';
import 'package:frontend/screens/home.dart';
import 'package:frontend/widgets/score_report/report_chart.dart';
import 'package:frontend/widgets/score_report/word_report_row.dart';

class QuizReport extends StatefulWidget {
  final List<WordReport> answeredWords;
  final int correct;
  final int wrong;
  final int totalQuestions;
  const QuizReport(
      {required this.answeredWords,
      required this.correct,
      required this.wrong,
      required this.totalQuestions,
      Key? key})
      : super(key: key);

  @override
  _QuizReportState createState() => _QuizReportState();
}

class _QuizReportState extends State<QuizReport> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var brightness = Theme.of(context).brightness;
    print(brightness);

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Home();
        }));
        return false;
      },
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: theme.appBarTheme.backgroundColor,
            shadowColor: theme.appBarTheme.shadowColor,
            leading: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                )),
            title: Text('Score Report',
                style: TextStyle(
                    //AppBar
                    fontFamily: 'SignikaNegative',
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: theme.shadowColor)),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReportChart(
                    correct: widget.correct,
                    wrong: widget.wrong,
                    totalQuestions: widget.totalQuestions),
                SizedBox(
                  height: 20,
                ),
               Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ListView.separated(
                      itemCount: widget.answeredWords.length,
                      itemBuilder: (context, index) {
                        return WordReportRow(
                            word: widget.answeredWords[index].word.traditional,
                            userAnswer: widget.answeredWords[index].userAnswer,
                            correctAnswer:
                                widget.answeredWords[index].word.pinyin);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? theme.canvasColor
                                    : theme.primaryColorDark);
                      },
                    ),
                  ),
                ), 
              ],
            ),
          )),
    );
  }
}
