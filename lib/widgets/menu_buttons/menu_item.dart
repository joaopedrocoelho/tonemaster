import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/menu_buttons/circular_submenu_wip.dart';

class MenuItem extends StatefulWidget {
  final String label;
  final List<Widget>? subMenu;

  MenuItem({Key? key, required this.label, this.subMenu}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  List<Widget> _subMenu = [];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.subMenu != null)
      widget.subMenu!.forEach((item) {
        _subMenu.add(Container(
          child: Center(
            child: item,
          ),
        ));
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    print("subMenu: ${widget.subMenu}");
    return Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: theme.primaryColor),
        child: Center(
            child: widget.subMenu != null
                ? CircularMenu(
                    children: widget.subMenu!,
                  )
                : Text(widget.label, style: TextStyle(fontSize: 30))));
  }
}
