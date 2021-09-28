import 'package:frontend/models/JSON/word_json.dart';
import 'package:frontend/utils/get_tones.dart';
import 'package:frontend/utils/indexed_iterables.dart';



class PlayWord {
  late Map<List<String>, List<int>> tones;
    
  PlayWord.fromWord(Word word) {
    this.tones = {};
    List<String> characters = [word.traditional, word.simplified];
    List<int> wordTones = getTones(word.pinyin);
    word.simplified.split("").forEach((char) { 
        this.tones[characters] = wordTones;
    });
      }
   
}

//function for splitting chars and adding to a list
//function for parsing the pinyin