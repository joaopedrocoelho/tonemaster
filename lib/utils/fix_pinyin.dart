import 'dart:io' show File;
import "./pinyin_convert_tool.dart";
import "dart:convert";



List<dynamic> dictionary = jsonDecode(new File('original.json').readAsStringSync());
List<Map<String,String>> words = [];


main() 
{
   dictionary.forEach((word) {
      Map<String,String> wordConverted =  {
    "traditional": word["traditional"],
    "simplified": word["simplified"],
    "pinyin": word['pinyin'],
    "english": word["english"],
    "accented-pinyin": convertToPinyin(word['pinyin'])
  };
  words.add(wordConverted);
   });
   File convertedDict = File('original-fixed.json');
   convertedDict.writeAsStringSync(json.encode(words)); 

 
}