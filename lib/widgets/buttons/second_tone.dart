import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons/tone_master_icons.dart';

class SecondToneButton extends StatelessWidget {
  const SecondToneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color:Colors.white70,
          border: Border.all(color: Colors.black12, width: 2),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(45))
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.only(right:50.0),
          child: Icon(ToneMasterIcons.second_tone, size: 70, color: Colors.black,),
        )),
      ),
    );
  }
}