import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
            gradient: LinearGradient(
           begin: Alignment.bottomCenter,
           end: Alignment.topCenter,
            stops: [
              0,
              0.2
            ], 
            colors: [
              Color(0xff57C6F2),//renders white
              Color(0xff247b8e),
              
            ]
          ),
          
                    border: Border.all(color: Colors.red, width:2 ) ,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(45))
        ),
    );
  }
}