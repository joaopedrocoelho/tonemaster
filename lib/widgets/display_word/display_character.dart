import 'package:flutter/material.dart';
import 'package:frontend/widgets/display_word/active_character/triangle.dart';

class DisplayCharacter extends StatefulWidget {
  final String character;
  final int id;

  const DisplayCharacter({
    Key? key,
    required this.character,
    required this.id,
  }) : super(key: key);

  @override
  _DisplayCharacterState createState() => _DisplayCharacterState();
}

class _DisplayCharacterState extends State<DisplayCharacter> {
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
                  fontSize: 90,
                  color: _isActive ? theme.highlightColor : theme.shadowColor)),
        ],
      ),
    );
  }
}
