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
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu_outlined,
        ),
        title: Text('Tone Master'),
        actions: [
          Icon(
            Icons.settings_outlined,
          ),
        ],
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
