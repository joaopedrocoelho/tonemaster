import 'package:flutter/material.dart';
import 'package:frontend/utils/degrees_to_radians.dart';
import 'package:frontend/utils/indexed_iterables.dart';
import 'package:frontend/widgets/menu/menu_buttons/submenu_item.dart';

class CircularMenu extends StatefulWidget {
  final Widget menuIcon;
  final List<SubMenuItem>? children;
  CircularMenu({Key? key, this.children, required this.menuIcon})
      : super(key: key);

  @override
  _CircularMenuState createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu>
    with TickerProviderStateMixin {
  bool _isOpen = false;
  bool _isAnimating = false;

  late AnimationController _animationController;
  late AnimationController _subMenuPositionController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _subMenuPositionAnimation;

  void open() {
    setState(() {
      _isOpen = true;
      _animationController.forward();
      _subMenuPositionController.forward();
      if (mounted) setState(() {});
    });
  }

  void close() {
    setState(() {
      _animationController.reverse();
      _subMenuPositionController.reverse();
      _isOpen = false;
    });
  }

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    _subMenuPositionController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 0.4)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.4, end: 0.9)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.9, end: 0.3)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50),
    ]).animate(_animationController);
    /* ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _subMenuPositionController.forward();
        }
      });
 */

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    _subMenuPositionAnimation =
        Tween<double>(begin: 0, end: MediaQuery.of(context).size.width * 0.2)
            .chain(CurveTween(curve: Curves.bounceIn))
            .animate(_subMenuPositionController);

    print(MediaQuery.of(context).size.width);
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (widget.children != null)
                  ..._renderSubMenu(
                      widget.children!, _subMenuPositionAnimation.value),

                //Center Button
                FractionallySizedBox(
                  widthFactor: _sizeAnimation.value,
                  heightFactor: _sizeAnimation.value,
                  child: Container(
                    child: RawMaterialButton(
                      fillColor: theme.primaryColor,
                      shape: CircleBorder(),
                      onPressed: () {
                        if (_isAnimating) return;

                        if (_isOpen) {
                          close();
                        } else {
                          open();
                        }
                      },
                      child: Center(
                          child: _isOpen
                              ? Icon(Icons.close,
                                  color: theme.shadowColor, size: 30)
                              : widget.menuIcon),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<Widget> _renderSubMenu(List<SubMenuItem> children, double distance) {
    List<Widget> _subMenu = [];
    double _angleRatio = 360 / children.length;

    children.forEachIndexed((item, index) {
      _subMenu.add(Transform.translate(
        offset: Offset.fromDirection(
            convertDegreesToRadians(index * _angleRatio), distance),
        child: RawMaterialButton(
            onPressed: () {
              close();
              item.onPressed();
            },
            fillColor: item.fillColor,
            shape: item.shape,
            child: item.child),
      ));
    });

    return _subMenu;
  }
}
