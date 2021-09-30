
import 'package:frontend/models/play_word.dart';
import 'package:frontend/utils/indexed_iterables.dart';
import 'package:frontend/widgets/display_word/display_character.dart';
/*  
List<DisplayCharacter> getTraditionalChars(PlayWord word) {
    Map<String, List<int>> _wordAndTones= {};
  List<DisplayCharacter> _traditionalCharacterList = [];
  
  //adds traditional chars to map
    word.tones.keys.forEach((key) { 
      _wordAndTones[key[0]] = word.tones[key]!;
    });

  //adds tones to list
    _wordAndTones.keys.forEachIndexed((word, index) {
      List<String> _chars = word.split("");
      _traditionalCharacterList.add(DisplayCharacter(character: _chars[index], tone: _wordAndTones[word][index], id: index));
    });
    
    return _traditionalCharacterList;
} */

/* List<DisplayCharacter> getSimplifiedChars(PlayWord word) {
  List<String> _tempList = [];
  List<DisplayCharacter> _simplifiedCharacterList = [];
  word.tones.keys.forEach((key) { 
      _tempList.add(key[1]);
    });
    _tempList.forEachIndexed((char, index) {
      _simplifiedCharacterList.add(DisplayCharacter(character: char, id: index));
    });
    
    return _simplifiedCharacterList;
} */