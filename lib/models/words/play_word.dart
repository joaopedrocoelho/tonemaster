import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_character.dart';
import 'package:frontend/utils/get_tones.dart';
import 'package:frontend/utils/indexed_iterables.dart';

class PlayWord {
  final List<PlayCharacter> characters;
  final String english;
  final String pinyin;
  final String? pinyinTw;
  final String pinyinAccented;
  final String? pinyinTwAccented;

  PlayWord(
      {required this.characters,
      required this.english,
      required this.pinyin,
      this.pinyinTw,
      required this.pinyinAccented,
      this.pinyinTwAccented});

  factory PlayWord.fromWord(Word word) => _$PlayCharactersFromWord(word);

  String tradToString() {
    String word = "";
    characters.forEach((character) {
      word += character.traditional;
    });
    return word;
  }

  String simplToString() {
    String word = "";
    characters.forEach((character) {
      word += character.simplified;
    });
    return word;
  }
}

PlayWord _$PlayCharactersFromWord(Word word) {
  List<PlayCharacter> _characters = [];
  List<String> _simplified = word.simplified.split("");
  //print("\x1B[33m word @ \$PlayCharactersFromWord @ play_word.dart : ${_simplified.toString()}");
  List<String> _traditional = word.traditional.split("");
  List<String> _accented = word.pinyinAccented.split(" ");
  List<String>? _twAccented =
      word.pinyinTwAccented != null ? word.pinyinTwAccented!.split(" ") : null;
  List<int> _tones = getTones(word.pinyin);
  List<int>? _tonesTw = word.pinyinTw != null ? getTones(word.pinyinTw!) : null;

  for (var i = 0; i < _simplified.length; i++) {
    //print("\x1B[35m ${_simplified[i]} \x1B[0m");
    _characters.add(PlayCharacter(
        simplified: _simplified[i],
        traditional: _traditional[i],
        tone: _tones[i],
        toneTW: _tonesTw != null ? _tonesTw[i] : null));
  }

  return PlayWord(
      characters: _characters,
      english: word.english,
      pinyin: word.pinyin,
      pinyinTw: word.pinyinTw,
      pinyinTwAccented: word.pinyinTwAccented,
      pinyinAccented: word.pinyinAccented
      );
}


  
//function for splitting chars and adding to a list
//function for parsing the pinyin