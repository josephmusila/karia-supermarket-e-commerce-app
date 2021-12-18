import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';
import 'package:karia/views/screens/categoryScreens/alternativeScreen.dart';
import 'package:karia/views/screens/categoryScreens/itemScreen.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  ProductItem(
      {required this.quantity,
      required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.price});

  String description;
  String id;
  String imageUrl;
  String name;
  int quantity;
  double price;
  String category;

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  var cartController = Get.find<CartController>();
 // var category = "foodStuffs";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ItemScreen(
            id: widget.id,
            description: widget.description,
            imageUrl: widget.imageUrl,
            name: widget.name,
            price: widget.price,
            category: widget.category,
            quantity: widget.quantity));
      },
      child: Card(
          child: GridTile(
        child: GestureDetector(
          onTap: () {
            Get.to(() => ItemScreen(
                id: widget.id,
                description: widget.description,
                imageUrl: widget.imageUrl,
                name: widget.name,
                category: widget.category,
                price: widget.price,
                quantity: widget.quantity));
          },
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            widget.name,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      )),
    );
  }
}


// ignore: must_be_immutable
class AlterNativeItem extends StatefulWidget {
  AlterNativeItem(
      {required this.quantity,
      required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.price});

  String description;
  String id;
  String imageUrl;
  String name;
  int quantity;
  double price;
  String category;

  @override
  _AlterNativeItemState createState() => _AlterNativeItemState();
}

class _AlterNativeItemState extends State<AlterNativeItem> {
  var cartController = Get.find<CartController>();
 // var category = "foodStuffs";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ItemScreen(
            id: widget.id,
            description: widget.description,
            imageUrl: widget.imageUrl,
            name: widget.name,
            price: widget.price,
            category: widget.category,
            quantity: widget.quantity));
      },
      child: Card(
          child: GridTile(
        child: GestureDetector(
          onTap: () {
            Get.to(() => AlternativeScreen(
                id: widget.id,
                description: widget.description,
                imageUrl: widget.imageUrl,
                name: widget.name,
                category: widget.category,
                price: widget.price,
                quantity: widget.quantity));
          },
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            widget.name,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),),
    );
  }
}

