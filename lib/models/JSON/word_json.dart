import 'package:frontend/models/words/play_word.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word_json.g.dart';

@JsonSerializable()
class Word {
  final String traditional;
  final String simplified;
  final String pinyin;
  final String english;

  Word(
      {required this.traditional,
      required this.simplified,
      required this.pinyin,
      required this.english});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
  factory Word.fromPlayWord(PlayWord playWord) => _$WordFromPlayWord(playWord);
  Map<String, dynamic> toJson() => _$WordToJson(this);

}
