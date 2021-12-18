import 'dart:math';

import 'package:flutter/material.dart';
import 'package:karia/views/customWidgets/customDrawer.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  var width = 120.0;
  var height = 140.0;
  var opacity = 0.0;
  var angle = 0.0;
  var animationDuration = Duration(milliseconds: 400);
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomValue();
    margin = randomValue();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  double randomValue({int max = 80}) {
    return Random().nextDouble() * max;
  }

  Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Contacts'),
      ),
      drawer: CustomDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: animationDuration,
              opacity: opacity,
              child: AnimatedContainer(
                margin: EdgeInsets.all(margin),
                transform: Matrix4.identity()..rotateZ(angle),
                transformAlignment: FractionalOffset.center,
                duration: animationDuration,
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("change look  "),
              onPressed: () {
                setState(() {
                  color = randomColor();
                  borderRadius = randomValue();
                  margin = randomValue();
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("change size"),
              onPressed: () {
                setState(() {
                  //setsState to recover tho
                  width = randomValue(max: 200);
                  height = randomValue(max: 300);
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(" rotate"),
              onPressed: () {
                setState(() {
                  angle = randomValue();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
