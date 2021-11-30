import 'package:flutter/material.dart';
import 'package:frontend/widgets/drawer/character_settings.dart';
import 'package:frontend/widgets/drawer/dictionary_settings.dart';
import 'package:frontend/widgets/drawer/quiz_settings.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Drawer(
          backgroundColor: theme.drawerTheme.backgroundColor,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5),
                child: Row(
                  children: [
                    MaterialButton(
                      minWidth: 0,
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_rounded, color: theme.canvasColor, size: 30)),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Settings',
                        style: theme.primaryTextTheme.button
                            ?.copyWith(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 1.5,
                color: theme.shadowColor,
                
              ),
              SizedBox(height: 20,),
              QuizSettings(),
              CharacterSettings(),
              SizedBox(
                height: 20,
              ),
              DictionarySettings()
            ],
          )),
    );
  }
}
