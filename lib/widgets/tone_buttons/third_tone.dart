import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/tone_buttons/tone_master_icons.dart';

class ThirdToneButton extends StatefulWidget {
   final void Function() onPressed;

  const ThirdToneButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ThirdToneButtonState createState() => _ThirdToneButtonState();
}

class _ThirdToneButtonState extends State<ThirdToneButton> {
  bool _pressed = false;
  double _borderWidth = 3;
  Color _bottomShadow = Color(0xff30a5bf);
  Color _topShadow = Color(0xffeef9fe);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onPressed();
          setState(() {
            _borderWidth = 0.00;
            _bottomShadow = Color(0xffdcf3fc);
            _topShadow = Color(0xffD3E8F2);
          });

          Timer(Duration(milliseconds: 100), () {
            setState(() {
              _borderWidth = 3;
              _bottomShadow = Color(0xff30a5bf);
              _topShadow = Color(0xffeef9fe);
            });
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: BoxDecoration(
              color: Color(0xffeef9fe),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff30a5bf),
                    offset: Offset(0, 0),
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
              border: Border(
                  bottom: BorderSide(
                      color: Color(0xff30a5bf), width: _borderWidth))),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 40),
            child:
                Icon(ToneMasterIcons.third_tone, color: Colors.black, size: 90),
          )),
        ),
      ),
    );
  }
}
