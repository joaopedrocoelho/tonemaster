
import 'package:frontend/models/play_word.dart';
import 'package:frontend/utils/indexed_iterables.dart';
import 'package:frontend/widgets/display_word/display_character.dart';

List<DisplayCharacter> getTraditionalChars(PlayWord word) {
  List<String> _tempList = [];
  List<DisplayCharacter> _traditionalCharacterList = [];
  word.tones.keys.forEach((key) { 
      _tempList.add(key[0]);
    });
    _tempList.forEachIndexed((char, index) {
      _traditionalCharacterList.add(DisplayCharacter(character: char, id: index));
    });
    
    return _traditionalCharacterList;
}

List<DisplayCharacter> getSimplifiedChars(PlayWord word) {
  List<String> _tempList = [];
  List<DisplayCharacter> _simplifiedCharacterList = [];
  word.tones.keys.forEach((key) { 
      _tempList.add(key[1]);
    });
    _tempList.forEachIndexed((char, index) {
      _simplifiedCharacterList.add(DisplayCharacter(character: char, id: index));
    });
    
    return _simplifiedCharacterList;
}