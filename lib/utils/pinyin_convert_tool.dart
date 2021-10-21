Map<String, String> pinyinValues = {
  'ai1' : 'āi',
  'ai2' : 'ái',
  'ai3' : 'ǎi',
  'ai4' : 'ài',
  'ai5' : 'ai',
  'ao1' : 'āi',
  'ao2' : 'áo',
  'ao3' : 'ǎo',
  'ao4' : 'ào',
  'ao5' : 'ao',
  'ou1'  : 'ōu',
  'ou2'  : 'óu',
  'ou3'  : 'ǒu',
  'ou4'  : 'òu',
  'ou5'  : 'ou',
  'a1': 'ā',
  'e1': 'ē',
  'i1': 'ī',
  'o1': 'ō',
  'u1': 'ū',
  'v1': 'ǖ',
  'u:1': 'ǖ',
  'a2': 'á',
  'e2': 'é',
  'i2': 'í',
  'o2': 'ó',
  'u2': 'ú',
  'v2': 'ǘ',
  'u:2': 'ǘ',
  'a3': 'ǎ',
  'e3': 'ě',
  'i3': 'ǐ',
  'o3': 'ǒ',
  'u3': 'ǔ',
  'v3': 'ǚ',
  'u:3': 'ǚ',
  'a4': 'à',
  'e4': 'è',
  'i4': 'ì',
  'o4': 'ò',
  'u4': 'ù',
  'v4': 'ǜ',
  'u:4': 'ǜ',
  'a5': 'a',
  'e5': 'e',
  'i5': 'i',
  'o5': 'o',
  'u5': 'u',
  'v5': 'ü',
  'u:5': 'ü',
  
};

String convertToPinyin(String numerical) {
  if (RegExp(r'[^aeiou]\d').hasMatch(numerical))
    numerical = checkForNumberAfterConsonant(numerical);


  pinyinValues.forEach((key, value) {
    if (numerical.contains(key)) 
    {
      numerical = numerical.replaceAll(key, value);
     
    }
  });
 
  return numerical;
}

String checkForNumberAfterConsonant(String numericalPinyin) {
  List<String> split = numericalPinyin.split('');
  //print(split);

  for (var i = split.length - 1; i > 0; i--) {
    if (RegExp(r'\d').hasMatch(split[i]) &&
        RegExp(r'[^aeiouv]').hasMatch(split[i - 1])) {
      split.insert(i - 1, split.removeAt(i));
    }
  }

  String converted = split.join();

  return converted;
}
