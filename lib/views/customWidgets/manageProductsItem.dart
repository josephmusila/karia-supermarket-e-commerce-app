import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/formController.dart';

// ignore: must_be_immutable
class ManageProductsItem extends StatefulWidget {
  String name;
  String imageUrl;
  String id;

  ManageProductsItem({
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  @override
  _ManageProductsItemState createState() => _ManageProductsItemState();
}

class _ManageProductsItemState extends State<ManageProductsItem> {
  var formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50,
          width: 50,
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          )),
      title: Text(widget.name),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async {
            try {
             formController.deleteItem(widget.id);
              setState(() {});
            } catch (error) {
              Get.snackbar("deleting failde", "Try Again");
            }
          }),
    );
  }
}
