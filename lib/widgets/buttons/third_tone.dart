import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons/tone_master_icons.dart';

class ThirdToneButton extends StatelessWidget {
  const ThirdToneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        
        decoration: BoxDecoration(
          color:Colors.white70,
          border: Border.all(color: Colors.black12, width: 2),
      
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.only(right:50.0, top:10),
          child: Icon(ToneMasterIcons.third_tone, size: 90, color: Colors.black,),
        )),
      ),
    );
  }
}