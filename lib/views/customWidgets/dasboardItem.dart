import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashBoardItem extends StatelessWidget {
  DashBoardItem(
      {required this.title, required this.iconData, required this.action});

  VoidCallback action;
  IconData iconData;
  String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
          child: Card(
            elevation: 7,
              child: GridTile(
              child: Center(
                  child: Icon(iconData,size: 50,color:Colors.deepOrange)),
              
              footer: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,),
      ),
          ),
    );
  }
}
