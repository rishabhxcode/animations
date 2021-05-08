import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2>
    with SingleTickerProviderStateMixin {
   AnimationController controller;

   Animation<double> rotationAnimation;
   Animation<double> canvasSizeAnimation;
   Animation<double> sizeAnimation;
   Animation<double> radiusAnimation;
   Animation<Color> colorAnimation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..addListener(() => setState(() {}));
    rotationAnimation = Tween<double>(
      begin: 0,
      end: 1.25,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 1.0, curve: Curves.easeOut)));
    canvasSizeAnimation = Tween<double>(begin: 50, end: 200).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.5, curve: Curves.easeOut)));
    sizeAnimation = Tween<double>(begin: 40, end: 200).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.5, 1, curve: Curves.easeInOut)));
    radiusAnimation = Tween<double>(begin: 50, end: 10).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.5, 1, curve: Curves.ease)));
    colorAnimation = ColorTween(begin: Colors.amber, end: Colors.cyan)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 1)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.center,
            child: RotationTransition(
              turns: rotationAnimation,
              child: Container(
                height: canvasSizeAnimation.value,
                width: canvasSizeAnimation.value,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: sizeAnimation.value,
                  width: sizeAnimation.value,
                  decoration: BoxDecoration(
                      color: colorAnimation.value,
                      borderRadius:
                          BorderRadius.circular(radiusAnimation.value)),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
              alignment: Alignment.center,
              child: RaisedButton(
                color: Colors.blue,
                elevation: 0,
                onPressed: () {
                  controller.isDismissed
                      ? controller.forward()
                      : controller.reverse();
                },
                child: Text(
                  'Animate',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        )
      ],
    ));
  }
}
