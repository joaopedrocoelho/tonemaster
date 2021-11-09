import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frontend/widgets/tone_buttons/button_colors.dart';
import 'package:frontend/widgets/tone_buttons/tone_master_icons.dart';

class FourthToneButton extends StatefulWidget {
  final void Function() onPressed;

  const FourthToneButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _FourthToneButtonState createState() => _FourthToneButtonState();
}

class _FourthToneButtonState extends State<FourthToneButton> {
  bool _pressed = false;
  double _yOffset = 1;
  double _blurRadius = 2;
  double _spreadRadius = 1;

  late var brightness;

  late Color _bottomShadow;
  late Color _topShadow;

  @override
  void initState() {
    // TODO: implement initState

    brightness = SchedulerBinding.instance!.window.platformBrightness;
    ;
    if (brightness == Brightness.light) {
      _bottomShadow = buttonColors['borderLight'];
      _topShadow = buttonColors['highlightLight'];
    } else {
      _bottomShadow = buttonColors['borderDark'];
      _topShadow = buttonColors['highlightDark'];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        setState(() {
          _yOffset = 0.00;
          _blurRadius = 0;
          if (brightness == Brightness.light) {
            _bottomShadow = buttonColors['baseLight'];
            _topShadow = buttonColors['shadowLight'];
          } else {
            _bottomShadow = buttonColors['baseDark'];
            _topShadow = buttonColors['shadowDark'];
          }
        });

        Timer(Duration(milliseconds: 100), () {
          setState(() {
            _yOffset = 1;
            _blurRadius = 2;
            if (brightness == Brightness.light) {
              _bottomShadow = buttonColors['borderLight'];
              _topShadow = buttonColors['highlightLight'];
            } else {
              _bottomShadow = buttonColors['borderDark'];
              _topShadow = buttonColors['highlightDark'];
            }
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: (brightness == Brightness.light)
                    ? buttonColors['borderLight']
                    : buttonColors['borderDark'],
                offset: Offset(0, _yOffset),
                blurRadius: _blurRadius,
                spreadRadius: _spreadRadius)
          ],
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.04, 0.2, 0.8, 1],
              colors: (brightness == Brightness.light)
                  ? [
                      buttonColors['baseLight'],
                      buttonColors['highlightLight'],
                      buttonColors['highlightLight'],
                      _topShadow,
                    ]
                  : [
                      buttonColors['baseDark'],
                      buttonColors['highlightDark'],
                      buttonColors['highlightDark'],
                      _topShadow,
                    ]),
        ),
        child: Center(
          child: Icon(
            ToneMasterIcons.fourth_tone,
            size: 70,
            color: (brightness == Brightness.light) ? buttonColors['iconLight'] : buttonColors['iconDark'],
          ),
        ),
      ),
    );
  }
}
