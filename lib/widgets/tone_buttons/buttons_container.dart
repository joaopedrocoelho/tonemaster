import 'package:flutter/material.dart';
import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/score_report/word_report.dart';
import 'package:frontend/models/words/play_character.dart';
import 'package:frontend/providers/quiz_data.dart';
import 'package:frontend/providers/score.dart';
import 'package:frontend/providers/score_report.dart';
import 'package:frontend/screens/report.dart';
import 'package:frontend/widgets/tone_buttons/fifth_tone.dart';
import 'package:frontend/widgets/tone_buttons/first_tone.dart';
import 'package:frontend/widgets/tone_buttons/fourth_tone.dart';
import 'package:frontend/widgets/tone_buttons/second_tone.dart';
import 'package:frontend/widgets/tone_buttons/third_tone.dart';
import 'package:provider/provider.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height * 0.27;

    return Consumer3<QuizData, Score, ScoreReport>(
        builder: (context, quizData, score, report, child) {
      List<int> _answers = [];

      void _sendReport() {
        report.add(WordReport(word: Word.fromPlayWord(quizData.activeWord), userAnswer: _answers));
        _answers = [];
      }

      void _showReport() {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return QuizReport(answeredWords: report.answeredWords);
        }));
      }

      void _onPressed(int tone) {
        _answers.add(tone); //for report list;

        quizData.checkIfAnswerIsCorrect(tone)
            ? score.incrementCorrect()
            : score.incrementWrong();
        if (!(quizData.activeIndex <
            (quizData.activeWord.characters.length - 1))) {
          score.decrementRemaining();
          _sendReport();
        }
        quizData.renderNextCharacter();
        if (quizData.gameOver) {
          _showReport();
        }
        /* print("quizData active Word: ${quizData.activeWord.toString()} index: ${quizData.words.indexOf(quizData.activeWord)}");
      
          print("quizData active Character: ${activeCharacter.traditional} activeIndex: ${quizData.activeIndex}");
          print("tone: ${activeCharacter.tone}"); */
      }

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: containerWidth,
          height: containerHeight,
          child: Stack(children: [
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SecondToneButton(
                        onPressed: () {
                          _onPressed(2);
                        },
                      ),
                      FirstToneButton(onPressed: () {
                        _onPressed(1);
                      })
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ThirdToneButton(onPressed: () {
                        _onPressed(3);
                      }),
                      FifthToneButton(onPressed: () {
                        _onPressed(5);
                      })
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                  height: containerHeight * 0.7,
                  child: FourthToneButton(onPressed: () {
                    _onPressed(4);
                  })),
            )
          ]),
        ),
      );
    });
  }
}
