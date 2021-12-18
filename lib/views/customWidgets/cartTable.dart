import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';
import 'package:karia/controller/cartController/cartController_page.dart';

// ignore: must_be_immutable
class CartTable extends StatefulWidget {
  String itemName;
  double price;
  int quantity;
  double subtottal;
  String id;

  CartTable({
    required this.id,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.subtottal,
  });

  @override
  State<CartTable> createState() => _CartTableState();
}

class _CartTableState extends State<CartTable> {
  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        color: Colors.amberAccent,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Confirm Deletion of the Item"),
                content: Text("Do you want to remove item from the cart?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("No")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("Yes"))
                ],
              );
            });
      },
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartController.removeItem(widget.id);
        cartController.totalAmount;
      },
      child: Table(
        defaultColumnWidth:
            FixedColumnWidth(MediaQuery.of(context).size.width / 5),
        border: TableBorder.all(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 1,
        ),
        children: [
          TableRow(children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.itemName,
                  //style: TextStyle(fontSize: 10.0),
                  textAlign: TextAlign.start,
                ),
              )
            ]),
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(widget.price.toString()
                    //style: TextStyle(fontSize: 10.0)
                    ),
              )
            ]),
            Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.quantity.toString(),
                    //style: TextStyle(fontSize: 10.0)
                  ))
            ]),
            Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.subtottal.toStringAsFixed(2),
                    // style: TextStyle(fontSize: 10.0)
                  ))
            ]),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        cartController.removeItem(widget.id);
                        Get.to(CartControllerPage());
                        setState(() {});
                      },
                      icon: Icon(Icons.delete)),
                )
              ],
            )
          ]),
        ],
      ),
    );
  }
}
