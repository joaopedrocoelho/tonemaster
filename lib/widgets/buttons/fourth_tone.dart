import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons/tone_master_icons.dart';

class FourthToneButton extends StatelessWidget {
  const FourthToneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 4),
      ),
      child: Center(
        child: Icon(ToneMasterIcons.fourth_tone, size: 70, color: Colors.black,),
        ),
      );
    
  }
}
