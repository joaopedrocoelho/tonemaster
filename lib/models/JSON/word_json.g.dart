// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  String? _pinyinTw = json['pinyin_tw'] != null ? json['pinyin_tw'] as String : null;
  String? _pinyinTwAccented = 
  json['pinyin_tw_accented'] != null ? json['pinyin_tw_accented'] as String : null;
  print("\x1B[32m word @ wordFromJson: ${json['simplified']} \x1B[0m");
 
  return Word(
    traditional: json['traditional'] as String,
    simplified: json['simplified'] as String,
    pinyin: json['pinyin'] as String,
    pinyinAccented: json['pinyin_accented'] as String,
    pinyinTw: _pinyinTw,
    pinyinTwAccented: _pinyinTwAccented,
    english: json['english'] as String,
  );
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'traditional': instance.traditional,
      'simplified': instance.simplified,
      'pinyin': instance.pinyin,
      'english': instance.english,
    };

Word _$WordFromPlayWord(PlayWord playWord) => Word(
  simplified: playWord.simplToString(),
  traditional: playWord.tradToString(),
  english: playWord.english,
  pinyin: playWord.pinyin,
  pinyinAccented: playWord.pinyinAccented,
  pinyinTw: playWord.pinyinTw,
  pinyinTwAccented: playWord.pinyinTwAccented
   );