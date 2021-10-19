import 'package:flutter/material.dart';
import 'package:frontend/models/score_report/word_report.dart';

class QuizReport extends StatefulWidget {
  final List<WordReport> answeredWords;
  const QuizReport({required this.answeredWords, Key? key}) : super(key: key);

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
        body: ListView.builder(
            itemCount: widget.answeredWords.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(widget.answeredWords[index].word.traditional),
                  Column(
                    children: [
                      Text("your answer"),
                      Text(widget.answeredWords[index].userAnswer.toString())
                    ],
                  ),
                  Column(
                    children: [
                      Text("correct answer"),
                      Text(widget.answeredWords[index].word.pinyin)
                    ],
                  )
                ],
              );
            }));
  }
}
