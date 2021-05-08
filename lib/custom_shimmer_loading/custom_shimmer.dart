import 'package:flutter/material.dart';

class CustomShimmer extends StatefulWidget {
  @override
  _CustomShimmerState createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
   AnimationController controller;
   Animation<double> shimmerAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    )
      ..addListener(() => setState(() {}))
      ..repeat();

    shimmerAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.1,
          0.9,
        )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[300],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.grey.shade300,
                    Colors.grey.shade100,
                    Colors.grey.shade300
                  ],
                  stops: [
                    0.0,
                    shimmerAnimation.value,
                    1,
                  ])),
        ),
      ),
    );
  }
}
