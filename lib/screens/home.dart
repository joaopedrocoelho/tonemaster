import 'package:flutter/material.dart';
import 'package:frontend/widgets/menu/default_items/hsk_menu.dart';
import 'package:frontend/widgets/menu/default_items/idioms_menu.dart';
import 'package:frontend/widgets/menu/default_items/tocfl_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/circular_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/menu_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        shadowColor: theme.appBarTheme.shadowColor,
        leading: Icon(
          Icons.menu_rounded,
          color: theme.shadowColor,
          size:40
        ),
        title: Text('Tone Master',
        style: TextStyle( //AppBar
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: theme.shadowColor)),
       /*  actions: [
          Icon(
            Icons.settings_rounded,
            color: theme.shadowColor,
          size:40
          ),
        ], */
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            HSKMenuItem(),
           
            TOCFLMenuItem(),
            IdiomsMenuItem(),
            MenuItem(
              label: "Random",
            ),
            MenuItem(
              label: "Ads",
            )
          ],
        ),
      ),
    );
  }
}
