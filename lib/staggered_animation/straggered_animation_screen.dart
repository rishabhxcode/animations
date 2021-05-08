import 'package:flutter/material.dart';

class StaggeredAnimationScreen extends StatefulWidget {
  @override
  _StaggeredAnimationScreenState createState() =>
      _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen>
    with SingleTickerProviderStateMixin {
   AnimationController controller;
   Animation<Offset> slideAnimation;
   Animation<double> rotateAnimation;
   Animation<double> sizeAnimation;
   Animation<double> radiusAnimation;
   Animation<Color> colorAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() => setState(() {}));
    setAnimations(controller);
    super.initState();
  }

  setAnimations(AnimationController controller) {
    slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -300))
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.5, curve: Curves.easeOutBack)));
    rotateAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.4, 1, curve: Curves.easeOut)));
    sizeAnimation = Tween<double>(begin: 50, end: 100)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.4, 1)));
    radiusAnimation = Tween<double>(begin: 50, end: 5)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.4, 1)));
    colorAnimation = ColorTween(begin: Colors.purpleAccent, end: Colors.orange)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Transform.translate(
          offset: slideAnimation.value,
          child: RotationTransition(
            turns: rotateAnimation,
            child: Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              decoration: BoxDecoration(
                  color: colorAnimation.value,
                  borderRadius: BorderRadius.circular(radiusAnimation.value)),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.animation),
        onPressed: () {
          controller.isDismissed ? controller.forward() : controller.reverse();
        },
      ),
    );
  }
}
