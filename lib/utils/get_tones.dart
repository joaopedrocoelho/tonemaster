List<int> getTones(String pinyin) {
  RegExp selectDigits = RegExp(r'(\d)');
  List<String> splitLines = pinyin.split(' ');
  List<int> tones= [];
  
  splitLines.forEach((tone) {
    final RegExpMatch? match = selectDigits.firstMatch(tone);
    if (match != null) {
      String number = match.group(0)!;
      tones.add(int.parse(number));
    }     
  });
  
  return tones;
}
