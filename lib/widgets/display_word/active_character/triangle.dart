import 'dart:math';

import 'package:flutter/material.dart';


class Triangle extends StatelessWidget {
  const Triangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        child:CustomPaint(
        size: Size(50,25),
        painter: DrawTriangleShape(color: theme.splashColor),
      
      )
    );
  }
}


class DrawTriangleShape extends CustomPainter {
  final Color color;
  late Paint painter;
 
  DrawTriangleShape({required this.color}) {
     painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
 
  }
  
  @override
  void paint(Canvas canvas, Size size) {
 
    var path = Path();
 
    path.lineTo(size.width/2, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    
    
    canvas.drawPath(path, painter);
    
    
  }
 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  }