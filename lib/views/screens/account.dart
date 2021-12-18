import 'package:flutter/material.dart';
import 'package:karia/views/customWidgets/customDrawer.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
     body: Container(),
    );

  }
}
