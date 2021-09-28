import 'package:flutter/material.dart';

void getWidgetInfo(BuildContext context, GlobalKey widgetKey) {
  final RenderBox renderBox =
      widgetKey.currentContext?.findRenderObject() as RenderBox;

  final Size size = renderBox.size; // or _widgetKey.currentContext?.size

  print('Size: ${size.width}, ${size.height}');

  final Offset offset = renderBox.localToGlobal(Offset.zero);

  print('Offset: ${offset.dx}, ${offset.dy}');

  print(
      'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
}

Size getWidgetSize(GlobalKey widgetKey) {
  final RenderBox renderBox =
      widgetKey.currentContext?.findRenderObject() as RenderBox;

  final Size size = renderBox.size; // or _widgetKey.currentContext?.size

  //print('Size: ${size.width}, ${size.height}');
  return size;
}
