import 'package:flutter/material.dart';

class StaggerDialog extends StatefulWidget {
  @override
  _StaggerDialogState createState() => _StaggerDialogState();
}

class _StaggerDialogState extends State<StaggerDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 13,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        color: Colors.transparent,
                        height: 350,
                        width: 300,
                        alignment: Alignment.center,
                        child: MyDialog(),
                      ),
                    );
                  });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple)),
            child: Text(
              'Open Dialog',
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog>
    with SingleTickerProviderStateMixin {
   AnimationController controller;
   Animation<double> heightAnimation;
   Animation<double> widthAnimation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750))
          ..addListener(() => setState(() {}));
    widthAnimation = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.4, curve: Curves.easeOutCubic)));
    heightAnimation = Tween<double>(begin: 4, end: 300).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1, curve: Curves.easeOutBack)));
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightAnimation.value,
      width: widthAnimation.value,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 4, color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Hello Champ!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await controller.reverse();
                  Navigator.of(context).pop();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
