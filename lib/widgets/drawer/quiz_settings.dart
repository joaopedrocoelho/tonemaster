import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/user_settings.dart';

class QuizSettings extends StatefulWidget {
  QuizSettings({Key? key}) : super(key: key);

  @override
  _QuizSettingsState createState() => _QuizSettingsState();
}

class _QuizSettingsState extends State<QuizSettings> {
  late int _count;

  @override
  void initState() {
    // TODO: implement initState
    _count = UserSettings.getQuizSize() ?? 5;
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
                      shape: BoxShape.circle, color: theme.canvasColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '考',
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
                Text('quiz size',
                    style: TextStyle(
                        //AppBar
                        fontFamily: 'SignikaNegative',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: theme.shadowColor))
              ],
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color: theme.canvasColor,
                          disabledColor: Colors.black26,
                          shape: CircleBorder(),
                          onPressed: _count == 5
                              ? null
                              : () {
                                  setState(() {
                                    _count -= 5;
                                    UserSettings.setQuizSize(_count);
                                  });
                                },
                          child: Icon(Icons.remove,
                              color: _count == 5
                                  ? theme.drawerTheme.backgroundColor
                                  : theme.backgroundColor),
                        ),
                        Text(
                          _count.toString(),
                          style: TextStyle(
                              fontFamily: "SignikaNegative",
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: theme.shadowColor),
                        ),
                        MaterialButton(
                          color: theme.canvasColor,
                          disabledColor: Colors.black26,
                          shape: CircleBorder(),
                          onPressed: _count == 100
                              ? null
                              : () {
                                  setState(() {
                                    _count += 5;
                                    UserSettings.setQuizSize(_count);
                                  });
                                },
                          child: Icon(Icons.add,
                              color: _count == 100
                                  ? theme.drawerTheme.backgroundColor
                                  : theme.backgroundColor),
                        ),
                      ],
                    ),
                    Text(
                      'words',
                      style: TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: theme.shadowColor),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
