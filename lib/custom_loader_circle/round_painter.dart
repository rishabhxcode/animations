import 'package:flutter/material.dart';
import 'dart:math';

class LoadingViewWidget extends StatefulWidget {
  @override
  _LoadingViewWidgetState createState() => _LoadingViewWidgetState();
}

class _LoadingViewWidgetState extends State<LoadingViewWidget>
    with SingleTickerProviderStateMixin {
  AnimationController arcAnimController;

  Tween<double> arcTweenStart = Tween(begin: 0 * pi, end: 1.6 * pi);
  Tween<double> arcTweenEnd = Tween(begin: 0.4 * pi, end: 2 * pi);

  @override
  void initState() {
    arcAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    arcAnimController.repeat(
      reverse: true
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: arcAnimController,
            builder: (context, widget) {
              return CustomPaint(
                painter: LoaderPaint(
                  arcStart: arcTweenStart.evaluate(arcAnimController),
                  arcEnd: arcTweenEnd.evaluate(arcAnimController),
                ),
                child: Container(
                  height: 100,
                  width: 100,
                ),
              );
            }),
        TextButton(
          child: Text("animate"),
          onPressed: () {
            arcAnimController.repeat();
            setState(() {});
          },
        )
      ],
    );
  }
}

class LoaderPaint extends CustomPainter {
  final double arcStart;
  final double arcEnd;

  LoaderPaint({this.arcStart, this.arcEnd});
  @override
  void paint(Canvas canvas, Size size) {
    var circlePainter = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    var arcPainter = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas
      ..drawCircle(Offset(size.width / 2, size.height / 2), size.height / 2,
          circlePainter)
      ..drawArc(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: size.height / 2),
          arcStart,
          arcEnd,
          false,
          arcPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
