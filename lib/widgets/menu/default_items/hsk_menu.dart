import 'package:flutter/material.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/screens/game.dart';
import 'package:frontend/utils/get_json_word_list.dart';
import 'package:frontend/widgets/menu/menu_buttons/circular_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/submenu_item.dart';

class HSKMenuItem extends StatefulWidget {
  const HSKMenuItem({Key? key}) : super(key: key);

  @override
  _HSKMenuItemState createState() => _HSKMenuItemState();
}

class _HSKMenuItemState extends State<HSKMenuItem> {
  List<PlayWord> _listOfWords = [];

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      children: [
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '1',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            _pushToScreen('assets/json/HSK1_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '2',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK2_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '3',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK3_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '4',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK4_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '5',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK5_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '6',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK6_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '7',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK6_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '8',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK6_dict.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '9',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/HSK6_dict.json');
          },
        ),
      ],
      menuIcon: Text('HSK'),
    );
  }

  void _pushToScreen(String file) {
    getJsonWordList(file).then(
        (list) => Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GameScreen(words: list);
            })));
  }
}
