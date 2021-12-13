import 'package:flutter/material.dart';

import 'package:frontend/providers/quiz_data.dart';

import 'package:frontend/widgets/display_word/display_character.dart';
import 'package:provider/provider.dart';

class DisplayWord extends StatefulWidget {
  //final PlayWord word;
  final List<DisplayCharacter> characters;
  DisplayWord({Key? key, required this.characters}) : super(key: key);

  @override
  _DisplayWordState createState() => _DisplayWordState();
}

class _DisplayWordState extends State<DisplayWord> {
  ScrollController _scrollController = ScrollController();
  final _containerKey = GlobalKey();
  late double _charsWidth;

  int? _numberOfColumns;
  int? _charsPerColumn;
  late int _activeIndex;
  int _scrollOffset = 100;

  _scrollListener() {}

  @override
  void initState() {
    //_scrollController.jumpTo(0);
    String _charsToString = '';
    widget.characters.forEach((char) {
        _charsToString += char.character;
    });
    
    _scrollController.addListener(_scrollListener);
    
    super.initState();
    _charsWidth = widget.characters.length * 100;
    

    _setNumberOfColumns();
   
  }

  @override
  void didChangeDependencies() {
     _activeIndex = context.watch<QuizData>().activeIndex;
     if (_activeIndex == 0) {
       _scrollController.animateTo(0, duration:  Duration(milliseconds: 50),
          curve: Curves.easeInOut,);
     }   
     
       if (_activeIndex >0 && _activeIndex  % _charsPerColumn! == 0) {
        _scrollController.animateTo(
          _scrollOffset.toDouble(),
          duration: Duration(milliseconds: 50),
          curve: Curves.easeInOut,
        );
        _scrollOffset+=100;
      } 
    super.didChangeDependencies();
  }

  void _setNumberOfColumns() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final RenderBox renderBox =
          _containerKey.currentContext?.findRenderObject() as RenderBox;
    print('\x1B[34m _charsWidth: $_charsWidth \x1B[0m');
    print('\x1B[34m renderBox.size.width: ${renderBox.size.width} \x1B[0m');
      setState(() {
        _numberOfColumns = (_charsWidth / renderBox.size.width).ceil();
        _charsPerColumn = (renderBox.size.width / 100).floor();
      });
      print("\x1B[34m columns: $_numberOfColumns, chars per column: $_charsPerColumn \x1B[0m");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizData>(builder: (context, quizData, child) {
     

      return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          key: _containerKey,
          child: Center(
            child: SingleChildScrollView(
              controller: _scrollController,
              child:  Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: widget.characters,
              ) 
            ),
          ));
    });
  }
}
