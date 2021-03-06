import 'package:flutter/material.dart';
import 'package:frontend/models/words/play_word.dart';
import 'package:frontend/screens/game.dart';
import 'package:frontend/utils/get_json_word_list.dart';
import 'package:frontend/utils/push_to_screen.dart';
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
     var theme = Theme.of(context);
    
TextStyle _textStyle = TextStyle(fontSize: 24, 
            color: theme.shadowColor, 
            fontFamily: "SignikaNegative",
            fontWeight:FontWeight.w700);



    return CircularMenu(
      distance:  MediaQuery.of(context).size.width * 0.18,
        children: [
        SubMenuItem(
          fillColor: Color(0xffFAB51C),
          child: Text(
            '1',
            style:_textStyle,
          ),
          onPressed: () {
            newPushToScreen('assets/json/dictionaries/TOCFL/TOCFL1.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xff1393A8),
          child: Text(
            '2',
            style:_textStyle,
          ),
          onPressed: () {
             newPushToScreen('assets/json/dictionaries/TOCFL/TOCFL2.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xffD8731C),
          child: Text(
            '3',
            style:_textStyle,
          ),
          onPressed: () {
             newPushToScreen('assets/json/dictionaries/TOCFL/TOCFL3.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xffB2352F),
          child: Text(
            '4',
            style:_textStyle,
          ),
          onPressed: () {
             newPushToScreen('assets/json/dictionaries/TOCFL/TOCFL4.json', context);
          },
        ),
        SubMenuItem(
          fillColor: Color(0xff673568),
          child: Text(
            '5&6',
            style:_textStyle,
          ),
          onPressed: () {
             newPushToScreen('assets/json/dictionaries/TOCFL/TOCFL5&6.json', context);
          },
          width: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),

        ),
      
       
      ],
      menuIcon: Text('TOCFL', style: theme.primaryTextTheme.button,),
    );
  }


}
