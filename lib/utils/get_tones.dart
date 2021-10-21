import "package:frontend/utils/indexed_iterables.dart";

List<int> getTones(String pinyin) {
  RegExp selectDigits = RegExp(r'(\d)');
  List<String> splitLines = pinyin.split('');
  List<int> tones = [];

  //print(splitLines);
  splitLines.forEachIndexed((tone, index) {
    final RegExpMatch? match = selectDigits.firstMatch(tone);
    if (match != null) {
      String number = match.group(0)!;
      tones.add(int.parse(number));
    } else if(match == null && index < splitLines.length -1 && splitLines[index+1] == " ") {
      tones.add(5);
    }
    else if (match == null && tone == splitLines[splitLines.length - 1]) {
      tones.add(5); //some words have omitted the 5th tone
    }
  });
 
  return tones;
}

