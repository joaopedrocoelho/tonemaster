import 'package:flutter/material.dart';
import 'package:frontend/widgets/menu_buttons/circular_submenu_wip.dart';
import 'package:frontend/widgets/menu_buttons/menu_item.dart';

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
            CircularMenu(children:[
              Text('1', style: TextStyle(fontSize: 20)),
              Text('2', style: TextStyle(fontSize: 20)),
              Text('3', style: TextStyle(fontSize: 20)),
              Text('4', style: TextStyle(fontSize: 20)),
              Text('5', style: TextStyle(fontSize: 20)),
              Text('6', style: TextStyle(fontSize: 20)),
            ]),
            MenuItem(label: "HSK", subMenu: [
              Text('1', style: TextStyle(fontSize: 20)),
              Text('2', style: TextStyle(fontSize: 20)),
              Text('3', style: TextStyle(fontSize: 20)),
              Text('4', style: TextStyle(fontSize: 20)),
              Text('5', style: TextStyle(fontSize: 20)),
              Text('6', style: TextStyle(fontSize: 20)),
            ]),
            MenuItem(
              label: "TOCFL",
            ),
            MenuItem(
              label: "成語",
            ),
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
