import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frontend/widgets/tone_buttons/button_colors.dart';
import 'package:frontend/widgets/tone_buttons/tone_master_icons.dart';

class SecondToneButton extends StatefulWidget {
  final void Function() onPressed;

  const SecondToneButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _SecondToneButtonState createState() => _SecondToneButtonState();
}

class _SecondToneButtonState extends State<SecondToneButton> {
  late var brightness;

  late Color _bottomShadow;
  late Color _topShadow;

  @override
  void initState() {
    // TODO: implement initState

    brightness = SchedulerBinding.instance!.window.platformBrightness;

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
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onPressed();
          setState(() {
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
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: (brightness == Brightness.light)
                        ? buttonColors['borderLight']
                        : buttonColors['borderDark'],
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 1)
              ],
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, 0.04, 0.2, 0.8, 1],
                  colors: (brightness == Brightness.light)
                      ? [
                          _bottomShadow,
                          buttonColors['baseLight'],
                          buttonColors['highlightLight'],
                          buttonColors['highlightLight'],
                          _topShadow,
                        ]
                      : [
                          _bottomShadow,
                          buttonColors['baseDark'],
                          buttonColors['highlightDark'],
                          buttonColors['highlightDark'],
                          _topShadow,
                        ]),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(45))),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Icon(
              ToneMasterIcons.second_tone,
              size: 70,
              color: (brightness == Brightness.light)
                  ? buttonColors['iconLight']
                  : buttonColors['iconDark'],
            ),
          )),
        ),
      ),
    );
  }
}
