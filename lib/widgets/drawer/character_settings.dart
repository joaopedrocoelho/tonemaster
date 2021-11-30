import 'package:flutter/material.dart';
import 'package:frontend/providers/user_settings.dart';

class CharacterSettings extends StatefulWidget {
  CharacterSettings({Key? key}) : super(key: key);

  @override
  _CharacterSettingsState createState() => _CharacterSettingsState();
}

class _CharacterSettingsState extends State<CharacterSettings> {
  late bool _useTraditional;
  late List<bool> _isSelected;

  @override
  void initState() {
    // TODO: implement initState
    
    _useTraditional = UserSettings.getCharacters() ?? false;
    if(_useTraditional) {
      _isSelected = [false,true];
      } else {
      _isSelected = [true, false];  
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double padding = 30;
    var theme = Theme.of(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.canvasColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '字',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: theme.backgroundColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('characters',
                    style: TextStyle(
                        //AppBar
                        fontFamily: 'SignikaNegative',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: theme.shadowColor))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 8.0),
              child: ToggleButtons(
                fillColor: theme.canvasColor,
                color: theme.shadowColor,
                selectedColor: theme.backgroundColor,
                renderBorder: false,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "SignikaNegative"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('simplified'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('traditional'),
                  )
                ],
                isSelected: _isSelected,
                onPressed: (int newIndex) {
                  newIndex == 0 ? 
                  setState(() {
                    _isSelected = [true, false];
                    UserSettings.setCharacters(false);
                  }) :
                  setState(() {
                    _isSelected = [false, true];
                    UserSettings.setCharacters(true);
                  });
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
