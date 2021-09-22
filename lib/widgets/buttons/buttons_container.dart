import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons/fifth_tone.dart';
import 'package:frontend/widgets/buttons/first_tone.dart';
import 'package:frontend/widgets/buttons/fourth_tone.dart';
import 'package:frontend/widgets/buttons/second_tone.dart';
import 'package:frontend/widgets/buttons/third_tone.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
     double containerWidth = MediaQuery.of(context).size.width;
     double containerHeight = MediaQuery.of(context).size.height * 0.27;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        
        child: Stack(
          children: [Column(
            children: [
              Expanded(
                child: Row(
                  children: [SecondToneButton(), FirstToneButton()],
                ),
              ),
              Expanded(
                child: Row(
                  children: [ThirdToneButton(), FifthToneButton()],
                ),
              )
            ],
          ),
          Center(
            child: Container(
              height: containerHeight * 0.7,
            
              child: FourthToneButton()),
          )
          ]
        ),
      ),
    );
  }
}
