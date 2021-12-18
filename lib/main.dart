import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:karia/views/screens/splashScreen.dart';

import 'controller/formController.dart';
import 'controller/screensController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 // var screenController = Get.put(ScreensController());
 // var formController = Get.put(FormController(),permanent:true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Karia',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: SplashScreen(),
    );
  }
}
