import 'package:flutter/material.dart';
import 'package:frontend/models/score_report/word_report.dart';
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
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu_outlined,
          ),
          title: Text('Tone Master'),
          actions: [
            Icon(
              Icons.settings_outlined,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ReportChart(
                  correct: widget.correct,
                  wrong: widget.wrong,
                  totalQuestions: widget.totalQuestions),
                SizedBox(height: 20,),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.answeredWords.length,
                  itemBuilder: (context, index) {
                    return WordReportRow(
                        word: widget.answeredWords[index].word.traditional,
                        userAnswer: widget.answeredWords[index].userAnswer,
                        correctAnswer: widget.answeredWords[index].word.pinyin);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
