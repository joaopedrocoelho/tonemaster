import 'package:flutter/material.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/screens/game.dart';
import 'package:frontend/utils/get_json_word_list.dart';
import 'package:frontend/widgets/menu/menu_buttons/circular_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/submenu_item.dart';

class TOCFLMenuItem extends StatefulWidget {
  const TOCFLMenuItem({Key? key}) : super(key: key);

  @override
  _TOCFLMenuItemState createState() => _TOCFLMenuItemState();
}

class _TOCFLMenuItemState extends State<TOCFLMenuItem> {
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
            _pushToScreen('assets/json/dictionaries/TOCFL/TOCFL1.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '2',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/TOCFL/TOCFL2.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '3',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/TOCFL/TOCFL3.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '4',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/TOCFL/TOCFL4.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '5&6',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/TOCFL/TOCFL5&6.json');
          },
        ),
      
       
      ],
      menuIcon: Text('TOCFL'),
    );
  }

  void _pushToScreen(String file) {
    getJsonWordList(file).then(
        (list) => Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GameScreen(words: list, numberOfWords: 5,);
            })));
  }
}
