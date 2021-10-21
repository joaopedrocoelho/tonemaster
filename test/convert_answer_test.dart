import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/utils/answer_to_pinyin.dart';

void main() {
  test("should change the numbers", () {
   String answer = convertUserAnswerToPinyin([1,4], "shan2dong3");
    expect(answer, "shan1dong4");
  });
}
