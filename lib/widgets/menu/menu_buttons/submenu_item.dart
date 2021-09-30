import 'package:flutter/material.dart';
  

class SubMenuItem extends StatelessWidget {
  final void Function()? onPressed;
  final Color? fillColor;
  final Widget child;
  const SubMenuItem({this.onPressed, this.fillColor, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
    fillColor: fillColor,
    shape: CircleBorder(),
    child: child);
  }
}