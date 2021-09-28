import 'package:flutter/material.dart';
import 'package:frontend/utils/get_widget_info.dart';

class CircularMenu extends StatefulWidget {
  List<Widget> children;
  CircularMenu({Key? key, required this.children}) : super(key: key);

  @override
  _CircularMenuState createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu> {
  bool _isOpen = false;
  bool _isAnimating = false;
  Size? _originalSize;
  double? _width;
  final GlobalKey _widgetKey = GlobalKey();


  void open() {
    setState(() {
      _isOpen = true;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
          _originalSize = getWidgetSize(_widgetKey);
         print('Size: ${_originalSize!.width}, ${_originalSize!.height}');
      });
      
    });
    super.initState();
  }

  void close() {
    setState(() {
      _isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.red,
            width: _originalSize != null? _originalSize!.width * 0.7 : 40,
            key: _widgetKey,
            child: RawMaterialButton(
              fillColor: Colors.blue,
              shape: CircleBorder(),
              onPressed: () {
                if (_isAnimating) return;

                if (_isOpen) {
                  close();
                } else {
                  open();
                  getWidgetInfo(context, _widgetKey);
                }
              },
              child: Center(child: Text('HSK')),
            ),
          ),
        ],
      ),
    );
  }
}
