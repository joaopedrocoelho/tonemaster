import 'package:flutter/material.dart';
import 'package:frontend/providers/user_settings.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:frontend/screens/home.dart';
import 'package:provider/provider.dart';


Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await UserSettings.init();

    
  runApp(
     MyApp()
    );
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chinese Tone Master',
      theme: ThemeData(
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(0xFF6ED2E9),
        ),
         appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff206E80),
          shadowColor: Color(0xff081926)
        ),
        primaryColor: Color(0xFF6ED2E9),
               primaryColorLight: Colors.blue,
        focusColor: Colors.red, //active character
        canvasColor: Color(0xff081926) , //word
        primaryColorDark: Color(0xff206E80),
        highlightColor: Colors.redAccent,
        hintColor: Colors.red,
        splashColor: Colors.lightGreen,
        indicatorColor: Colors.lightGreen,
        shadowColor: Color(0xff081926) ,
        backgroundColor: Color(0xffEDFCFF),
        primaryTextTheme: TextTheme(
         
          bodyText1: TextStyle( //AppBar
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Theme.of(context).shadowColor),
          button: TextStyle( //CircularMenu
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w600,
            fontSize: 40,
            color: Theme.of(context).shadowColor),
          caption: TextStyle( //CircularSubMenu
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w400,
            color: Theme.of(context).shadowColor)
        )     
      ),
      darkTheme: ThemeData(
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(0xff161B3B),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff161B3B),
          shadowColor: Colors.transparent
        ),
        primaryColor: Color(0xFF344566),
        
        primaryColorLight: Colors.blue,
        focusColor: Colors.deepOrange[400], //active character
        canvasColor: Color(0xffEDFCFF) , //word
        primaryColorDark: Color(0xFF213240),
        highlightColor: Colors.red,
        hintColor: Colors.red,
        splashColor: Colors.lightGreen,
        indicatorColor: Colors.lightGreen,
        shadowColor: Color(0xffEDFCFF),
        backgroundColor: Color(0xff050C1A),
        primaryTextTheme: TextTheme(
           
          bodyText1: TextStyle( //AppBar
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Theme.of(context).shadowColor),
          button: TextStyle( //CircularMenu
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w600,
            fontSize: 40,
            color: Color(0xffEDFCFF)),
          caption: TextStyle( //CircularSubMenu
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w400,
            color: Theme.of(context).shadowColor)
        )     
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


