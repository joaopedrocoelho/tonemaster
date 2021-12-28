import 'dart:math';

import 'package:flutter/material.dart';


class Triangle extends StatefulWidget {
  const Triangle({Key? key}) : super(key: key);

  @override
  State<Triangle> createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  final _key = GlobalKey();
  double? _yPos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPosition();
    print("key :$_key");
   
  }

  void _getPosition() {
    WidgetsBinding.instance?.addPostFrameCallback((_) { 
      final RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
     
    final Offset position = renderBox.localToGlobal(Offset.zero);
    
    setState(() {
      _yPos = position.dy;
    });
     //print("yPos :$_yPos, position :${position.dy}");
    });
    
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
       key: _key,
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