import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/models/words/play_character.dart';
import 'package:frontend/utils/get_tones.dart';
import 'package:frontend/utils/indexed_iterables.dart';



class PlayWord {
  final List<PlayCharacter> characters;
  final String english;
  final String pinyin;
  

  PlayWord({
  required this.characters, 
  required this.english,
  required this.pinyin});

 

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
  List<String> _traditional = word.traditional.split("");
  List<int> _tones = getTones(word.pinyin);


  for (var i = 0; i < _simplified.length; i++) {
    _characters.add(
      PlayCharacter(simplified: _simplified[i],
      traditional: _traditional[i],
      tone:_tones[i])
    );
  }


return PlayWord(
  characters: _characters, 
  english: word.english,
  pinyin: word.pinyin);
 }


  
//function for splitting chars and adding to a list
//function for parsing the pinyin