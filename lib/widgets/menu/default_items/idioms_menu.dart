import 'package:flutter/material.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/screens/game.dart';
import 'package:frontend/utils/get_json_word_list.dart';
import 'package:frontend/widgets/menu/menu_buttons/circular_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/submenu_item.dart';

class IdiomsMenuItem extends StatefulWidget {
  const IdiomsMenuItem({Key? key}) : super(key: key);

  @override
  _IdiomsMenuItemState createState() => _IdiomsMenuItemState();
}

class _IdiomsMenuItemState extends State<IdiomsMenuItem> {
  List<PlayWord> _listOfWords = [];

  

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      children: [
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '100',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json', 100);
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '500',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json', 500);
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '1000',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json', 1000);
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            '2000',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json');
          },
        ),
        SubMenuItem(
          fillColor: Colors.teal,
          child: Text(
            'extra',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-extra.json');
          },
        ),
        
       
      ],
      menuIcon: Text('Idioms'),
    );
  }

  void _pushToScreen(String file, [int? slice]) {
    getJsonWordList(file, slice).then(
        (list) => Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GameScreen(words: list, numberOfWords: 5,);
            })));
  }
}
