import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';


class MenuItem extends StatefulWidget {
  final String label;
  void Function()? onTap;
 

  MenuItem({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  

  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
  //animate container size on tap
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: theme.primaryColor),
          child: Center(
              child:Text(widget.label, style: TextStyle(fontSize: 30)))),
    );
  }
}
