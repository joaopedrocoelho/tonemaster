import 'package:flutter_test/flutter_test.dart';


import 'package:frontend/utils/get_json_word_list.dart';
import 'package:frontend/utils/pinyin_convert_tool.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
   test("Converted should have no digits", () {
    RegExp digits = RegExp(r'\d');
          String converted = convertToPinyin("fen1 hong2");
          expect(converted, "fēn hóng");
        });
      
   }


   
  
