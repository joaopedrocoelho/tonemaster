import 'package:flutter/material.dart';
import 'package:frontend/providers/user_settings.dart';

class DictionarySettings extends StatefulWidget {
  DictionarySettings({Key? key}) : super(key: key);

  @override
  _DictionarySettingsState createState() => _DictionarySettingsState();
}

class _DictionarySettingsState extends State<DictionarySettings> {
  late bool _useTwTones;
  late List<bool> _isSelected;

  @override
  void initState() {
    // TODO: implement initState
     _useTwTones = UserSettings.getTones() ?? false;
      if(_useTwTones) {
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
                      '音',
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
                Text('tones',
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
                    child: Text('Mainland China'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Taiwan'),
                  )
                ],
                isSelected: _isSelected,
                onPressed: (int newIndex) {
                  newIndex == 0 ? 
                  setState(() {
                    _isSelected = [true, false];
                    UserSettings.setTones(false);
                  }) :
                  setState(() {
                    _isSelected = [false, true];
                    UserSettings.setTones(true);
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
