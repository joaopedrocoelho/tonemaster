import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/tone_buttons/tone_master_icons.dart';

class FourthToneButton extends StatefulWidget {
  const FourthToneButton({Key? key}) : super(key: key);

  @override
  _FourthToneButtonState createState() => _FourthToneButtonState();
}

class _FourthToneButtonState extends State<FourthToneButton> {
  bool _pressed = false;
  double _yOffset = 1;
  double _blurRadius = 2;
  double _spreadRadius = 1;
  Color _bottomShadow = Color(0xff30a5bf);
  Color _topShadow = Color(0xffeef9fe);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _yOffset = 0.00;
          _blurRadius = 0;

          _bottomShadow = Color(0xffdcf3fc);
          _topShadow = Color(0xffD3E8F2);
        });

        Timer(Duration(milliseconds: 100), () {
          setState(() {
            _yOffset = 1;
            _blurRadius = 2;
            _bottomShadow = Color(0xff30a5bf);
            _topShadow = Color(0xffeef9fe);
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Color(0xff30a5bf),
                offset: Offset(0, _yOffset),
                blurRadius: _blurRadius,
                spreadRadius: _spreadRadius)
          ],
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [
                0.04,
                0.2,
                0.8,
                1
              ],
              colors: [
                Color(0xffdcf3fc),
                Color(0xffeef9fe),
                Color(0xffeef9fe),
                _topShadow,
              ]),
        ),
        child: Center(
          child: Icon(
            ToneMasterIcons.fourth_tone,
            size: 70,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
