import 'dart:math';

import 'package:flutter/material.dart';


class Triangle extends StatelessWidget {
  const Triangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:CustomPaint(
        size: Size(50,25),
        painter: DrawTriangleShape(),
      
      )
    );
  }
}


class DrawTriangleShape extends CustomPainter {
 
  late Paint painter;
 
  DrawTriangleShape() {
     painter = Paint()
      ..color = Colors.blueGrey
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