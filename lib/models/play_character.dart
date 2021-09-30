import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/play_word.dart';

class PlayCharacter {
  final String traditional;
  final String simplified;
  final int tone;

  PlayCharacter(
      {required this.traditional,
      required this.simplified,
      required this.tone});
}
