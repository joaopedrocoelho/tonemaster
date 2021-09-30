import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/play_character.dart';
import 'package:frontend/utils/get_tones.dart';
import 'package:frontend/utils/indexed_iterables.dart';



class PlayWord {
  final List<PlayCharacter> characters;

  PlayWord({required this.characters});

  factory PlayWord.fromWord(Word word) => _$PlayCharactersFromWord(word);
    
}

 PlayWord _$PlayCharactersFromWord(Word word) {
  List<PlayCharacter> _characters = [];
  List<String> _simplified = word.simplified.split("");
  List<String> _traditional = word.traditional.split("");
  List<int> _tones = getTones(word.pinyin);

  for (var i = 0; i < _simplified.length; i++) {
    _characters.add(
      PlayCharacter(simplified: _simplified[i],
      traditional: _traditional[i],
      tone: _tones[i])
    );
  }


return PlayWord(characters: _characters);
 }

//function for splitting chars and adding to a list
//function for parsing the pinyin