import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frontend/utils/degrees_to_radians.dart';
import 'package:frontend/utils/indexed_iterables.dart';
import 'package:frontend/widgets/menu/menu_buttons/submenu_item.dart';
import 'dart:async';

class CircularMenu extends StatefulWidget {
  final Widget menuIcon;
  final List<SubMenuItem>? children;
  final double distance;
  CircularMenu({Key? key, this.children, required this.menuIcon, required this.distance})
      : super(key: key);

  @override
  _CircularMenuState createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu>
    with TickerProviderStateMixin {
  bool _isOpen = false;
  bool _isAnimating = false;
  double _distance = 0;
  double _subMenuDistance = 0;

  late AnimationController _animationController;
  late AnimationController _subMenuPositionController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _subMenuPositionAnimation;

  void open() {
    setState(() {
      

      _isOpen = true;
      _animationController.forward();
      _subMenuPositionController.forward();
      
    });
  }

  void close() {
    setState(() {
      _animationController.reverse();
      _subMenuPositionController.reverse().whenComplete(() => {
        setState(() {
          _isOpen = false;
        })
      });
         })
    ;
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
    ]).animate(_animationController)..addStatusListener((status) {
      if (status == AnimationStatus.forward || status == AnimationStatus.reverse) {
       
        setState(() {
          _isAnimating = true;
        });
       
      } else {
        setState(() {
          _isAnimating = false;
        });
        
      }
    });

    _subMenuPositionAnimation =
        Tween<double>(begin: 0, end: widget.distance)
            .chain(CurveTween(curve: Curves.bounceIn))
            .animate(_subMenuPositionController)..addStatusListener((_) { 
              
            });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _subMenuPositionController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);



    //print("_distance: $_distance");
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (widget.children != null)
                  ..._renderSubMenu(
                      widget.children!,  _subMenuPositionAnimation.value),

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

    //print("distance: $distance");
    children.forEachIndexed((item, index) {
      _subMenu.add(Transform.translate(
        offset: Offset.fromDirection(
            convertDegreesToRadians(index * _angleRatio), distance),
        child: SizedBox(
          width: item.width,
          child: RawMaterialButton(
            
              onPressed: () {
                close();
                item.onPressed();
              },
              fillColor: item.fillColor,
              shape: item.shape,
              child: item.child),
        ),
      ));
    });

    return _subMenu;
  }
}
