import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';


class MenuItem extends StatefulWidget {
  final String label;
 

  MenuItem({Key? key, required this.label}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  List<Widget> _subMenu = [];

  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
 
    return Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: theme.primaryColor),
        child: Center(
            child:Text(widget.label, style: TextStyle(fontSize: 30))));
  }
}
