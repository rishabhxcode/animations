import 'package:animations/custom_loader_circle/round_painter.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LoadingViewWidget()),
    );
  }
}
