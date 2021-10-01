import 'package:flutter/material.dart';
import 'package:frontend/models/play_word.dart';

class PlayWordList extends ChangeNotifier {
    final List<PlayWord> words;

    PlayWordList(this.words);
}