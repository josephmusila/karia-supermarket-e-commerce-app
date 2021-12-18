import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  initState() {
    

    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  color: Colors.yellow,
                  strokeWidth: 10,
                  semanticsValue: "hello",
                  //value: 0.6,
                ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/online-shopping.jpeg")
            ,fit:BoxFit.cover,
          )
        ),
      ),
    );
  }
}
