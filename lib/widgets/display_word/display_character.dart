import 'package:flutter/material.dart';
import 'package:frontend/widgets/display_word/active_character/triangle.dart';

class DisplayCharacter extends StatefulWidget {
  final String character;
  final int tone;
  final int id;

  const DisplayCharacter({
    Key? key,
    required this.character,
    required this.id,
    required this.tone,
  }) : super(key: key);

  @override
  _DisplayCharacterState createState() => _DisplayCharacterState();
}

class _DisplayCharacterState extends State<DisplayCharacter> {
  @override
  void initState() {
    super.initState();
    print("character: ${widget.character}, tone: ${widget.tone}");
  }

  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      //color: Colors.indigo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_isActive) Triangle(),
          Text(widget.character,
              style: TextStyle(
                  fontSize: 150,
                  color: _isActive ? theme.highlightColor : theme.shadowColor)),
        ],
      ),
    );
  }
}
