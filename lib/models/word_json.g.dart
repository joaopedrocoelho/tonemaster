// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word(
    traditional: json['traditional'] as String,
    simplified: json['simplified'] as String,
    pinyin: json['pinyin'] as String,
    english: json['english'] as String?,
  );
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'traditional': instance.traditional,
      'simplified': instance.simplified,
      'pinyin': instance.pinyin,
      'english': instance.english,
    };
