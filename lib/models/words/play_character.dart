import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_word.dart';

class PlayCharacter {
  final String traditional;
  final String simplified;
  final int tone;
  final int? toneTW;

  PlayCharacter(
      {required this.traditional,
      required this.simplified,
      required this.tone,
      this.toneTW});
}
