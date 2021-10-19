import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/utils/get_tones.dart';

class WordReport {
  Word word;
  late bool answeredRight;
  List<int> userAnswer;

  WordReport({
    required this.word, required this.userAnswer
  }) {
    answeredRight = getTones(word.pinyin) != userAnswer ? false :true;
    }
  }
