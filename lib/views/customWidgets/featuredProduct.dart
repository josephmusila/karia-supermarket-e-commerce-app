import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FeaturedProduct extends StatelessWidget {
  String name;
  String imageUrl;

  FeaturedProduct({
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Image.network(imageUrl),
        onTap: () {},
      ),
      footer: GridTileBar(
        backgroundColor: Colors.orange.withOpacity(0.5),
        title: Text(name,style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),),
      ),
    );
  }
}
