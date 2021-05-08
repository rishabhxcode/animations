import 'package:flutter/material.dart';

class FlowExample extends StatefulWidget {
  @override
  _FlowExampleState createState() => _FlowExampleState();
}

class _FlowExampleState extends State<FlowExample>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this)
      ..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: Flow(
            delegate: MyDelegate(animValue:10 * controller.value),
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends FlowDelegate {
  final double animValue;

  MyDelegate({this.animValue});
  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; i++) {
      context.paintChild(i,
          transform: Matrix4.translationValues(animValue, 0, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
