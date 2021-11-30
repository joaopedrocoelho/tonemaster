import 'package:flutter/material.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/screens/game.dart';
import 'package:frontend/utils/get_json_word_list.dart';
import 'package:frontend/utils/push_to_screen.dart';
import 'package:frontend/widgets/menu/menu_buttons/circular_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/submenu_item.dart';
import 'dart:async';

class HSKMenuItem extends StatefulWidget {
  const HSKMenuItem({Key? key}) : super(key: key);

  @override
  _HSKMenuItemState createState() => _HSKMenuItemState();
}

class _HSKMenuItemState extends State<HSKMenuItem> {
  List<PlayWord> _listOfWords = [];

  

  

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    
TextStyle _textStyle = TextStyle(fontSize: 24, 
            color: theme.shadowColor, 
            fontFamily: "SignikaNegative",
            fontWeight:FontWeight.w700);


    return CircularMenu(
      key: Key("HSK"),
      children: [
        SubMenuItem(
          fillColor: Color(0xffFAB51C),
          child: Text(
            '1',
            style: _textStyle,
          ),
          onPressed: () {
             pushToScreen('assets/json/dictionaries/HSK/HSK1.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xff1393A8),
          child: Text(
            '2',
            style: _textStyle,
          ),
          onPressed: () {
             pushToScreen('assets/json/dictionaries/HSK/HSK2.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xffD8731C),
          child: Text(
            '3',
            style: _textStyle,
          ),
          onPressed: () {
             pushToScreen('assets/json/dictionaries/HSK/HSK3.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xffB2352F),
          child: Text(
            '4',
            style: _textStyle,
          ),
          onPressed: () {
             pushToScreen('assets/json/dictionaries/HSK/HSK4.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xff404894),
          child: Text(
            '5',
            style: _textStyle,
          ),
          onPressed: () {
             pushToScreen('assets/json/dictionaries/HSK/HSK5.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xff673568),
          child: Text(
            '6',
            style: _textStyle,
          ),
          onPressed: () {
            pushToScreen('assets/json/dictionaries/HSK/HSK6.json',context);
          },
        ),
       
      ],
      menuIcon: Text('HSK', style: theme.primaryTextTheme.button),
    );
  }

}
