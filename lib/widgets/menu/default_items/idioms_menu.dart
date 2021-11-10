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
         var theme = Theme.of(context);
    
TextStyle _textStyle = TextStyle(fontSize: 18, 
            color: theme.shadowColor, 
            fontFamily: "SignikaNegative",
            fontWeight:FontWeight.w700);

 
    return CircularMenu(
      children: [
        SubMenuItem(
          width: 50,
          fillColor: Color(0xffFAB51C),
          child: Text(
            '100',
            style: _textStyle,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          onPressed: () {
            _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json', 100);
          },
        ),
        SubMenuItem(
          width: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          fillColor: Color(0xff1393A8),
          child: Text(
            '500',
            style: _textStyle,
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json', 500);
          },
        ),
        SubMenuItem(
          width: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          fillColor: Color(0xffD8731C),
          child: Text(
            '1000',
            style: _textStyle,
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json', 1000);
          },
        ),
        SubMenuItem(
          width: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          fillColor: Color(0xffB2352F),
          child: Text(
            '2000',
            style: _textStyle,
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-sorted.json');
          },
        ),
        SubMenuItem(
          width: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          fillColor: Color(0xff673568),
          child: Text(
            'extra',
            style: _textStyle,
          ),
          onPressed: () {
             _pushToScreen('assets/json/dictionaries/idioms/idioms-extra.json');
          },
        ),
        
       
      ],
      menuIcon: Text('Idioms', style: theme.primaryTextTheme.button),
    );
  }

  void _pushToScreen(String file, [int? slice]) {
    getJsonWordList(file, slice).then(
        (list) => Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GameScreen(words: list, numberOfWords: 5,);
            })));
  }
}
