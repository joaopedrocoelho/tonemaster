import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons/buttons_container.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(child: ButtonsContainer()),
      ),
    );
  }
}