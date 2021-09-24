import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons/tone_master_icons.dart';

class FirstToneButton extends StatefulWidget {
  const FirstToneButton({Key? key}) : super(key: key);

  @override
  _FirstToneButtonState createState() => _FirstToneButtonState();
}

class _FirstToneButtonState extends State<FirstToneButton> {
  Color _bottomShadow = Color(0xff30a5bf);
  Color _topShadow = Color(0xffeef9fe);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _bottomShadow = Color(0xffdcf3fc);
            _topShadow = Color(0xffD3E8F2);
          });
          Timer(Duration(milliseconds: 100), () {
            setState(() {
              _bottomShadow = Color(0xff30a5bf);
              _topShadow = Color(0xffeef9fe);
            });
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xff30a5bf),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 1)
              ],
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [
                    0,
                    0.04,
                    0.2,
                    0.8,
                    1
                  ],
                  colors: [
                    _bottomShadow,
                    Color(0xffdcf3fc),
                    Color(0xffeef9fe),
                    Color(0xffeef9fe),
                    _topShadow,
                  ]),
              borderRadius: BorderRadius.only(topRight: Radius.circular(45))),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Icon(
              ToneMasterIcons.first_tone,
              size: 70,
              color: Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}
