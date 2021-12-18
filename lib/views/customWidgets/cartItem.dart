import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';


// ignore: must_be_immutable
class CartItemTile extends StatefulWidget {
  String id;
  String name;
  double price;
  int quantity;
  double subTotal;

  CartItemTile(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.subTotal});

  @override
  _CartItemTileState createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  var cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Get.to(()=>ItemScreen())
      },
          child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(flex: 3, child: Text(widget.name)),
              Expanded(flex: 2, child: Text(widget.price.toStringAsFixed(2))),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // GestureDetector(
                    //   behavior: HitTestBehavior.translucent,
                    //   child: Text(
                    //     "  -  ",
                    //     style: TextStyle(backgroundColor: Colors.green),
                    //   ),
                    //   onTap: () {
                        
                    //     cartController.reduceItemQuantity(widget.id);
                    //   },
                    // ),


                    Text(widget.quantity.toString()),


                    // GestureDetector(
                    //   child: Text(
                    //     "  +  ",
                    //     style: TextStyle(backgroundColor: Colors.green),
                    //   ),
                    //   onTap: () {
                    //     setState(() {
                          
                    //     });
                    //     cartController.addItemQuantity(widget.id);
                    //   },
                    // ),
                  ],
                ),
              ),
              Expanded(flex: 2, child: Text(widget.subTotal.toString())),
              Expanded(flex:1,child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),)
            ],
          ),
        ),
      ),
    );
  }
}
