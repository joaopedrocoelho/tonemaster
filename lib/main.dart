import 'package:flutter/material.dart';


import 'package:frontend/screens/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chinese Tone Master',
      theme: ThemeData(
        primaryColor: Color(0xff30a5bf),
        primaryColorLight: Color(0xff57C6F2),
        primaryColorDark: Color(0xff206E80),
        highlightColor: Color(0xfff25e95),
        accentColor: Color(0xff7eF286),
        primarySwatch: MaterialColor(165,primarySwatch),
        shadowColor: Colors.black
      ),
      home: Home(),
    );
  }
}

Map<int, Color> primarySwatch = {
  50:  Color.fromRGBO(48, 165, 191, .1),
  100: Color.fromRGBO(48, 165, 191, .2),
  200: Color.fromRGBO(48, 165, 191, .3),
  300: Color.fromRGBO(48, 165, 191, .4),
  400: Color.fromRGBO(48, 165, 191, .5),
  500: Color.fromRGBO(48, 165, 191, .6),
  600: Color.fromRGBO(48, 165, 191, .7),
  700: Color.fromRGBO(48, 165, 191, .8),
  800: Color.fromRGBO(48, 165, 191, .9),
  900: Color.fromRGBO(48, 165, 191, 1),
};


