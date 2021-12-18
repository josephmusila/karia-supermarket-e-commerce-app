import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:karia/views/customWidgets/cartTable.dart';
import 'package:karia/views/screens/ordersHistory.dart';
import 'package:karia/views/screens/paymentScreen.dart';
import '../orderHistoryController.dart';
import './cartController_controller.dart';

class CartControllerPage extends StatefulWidget {
  @override
  _CartControllerPageState createState() => _CartControllerPageState();
}

class _CartControllerPageState extends State<CartControllerPage> {
  var cartController = Get.find<CartController>();
  var orderHistoryController =
      Get.put(OrderHistoryController(), permanent: true);

  @override
  initState() {
    super.initState();
    //cartController.updateSubtotal(cartController.cartItem.values.toString().);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: Center(
                  child: Text(
                    "Total",
                    style: TextStyle(fontSize: 15, color: Colors.orange),
                  ),
                )),
                Text(
                  cartController.totalAmount.toStringAsFixed(2),
                  style: TextStyle(fontSize: 15, color: Colors.orange),
                ),
                ElevatedButton(
                    child: Text("Order Now"),
                    onPressed: () {
                      Get.to(() => PaymentScreen());
                      // cartController.clearCart();
                      // orderHistoryController.addOrder(
                      //     DateTime.now().toString(), cartController.cartItem);
                      // print(orderHistoryController.orderItem);
                      // //Get.to(() => OrdersHistory());
                      // Get.off(() => OrdersHistory());
                      // Get.snackbar(
                      //   "Order Added Succesfully",
                      //   "Check Your Orders History",
                      //   duration: Duration(seconds: 5),
                      // );
                      // for (var i = 0;
                      //     i < cartController.cartItem.values.toList().length;
                      //     i++) {
                      //   print(cartController.cartItem.values.toList()[i].id);
                      // }
                    })
              ],
            ),
            SizedBox(height: 20),
            Table(
                defaultColumnWidth:
                    FixedColumnWidth(MediaQuery.of(context).size.width / 5),
                //border: TableBorder.all(
                // color: Colors.grey,
                //style: BorderStyle.solid,
                // width: 1,
                //),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text(
                        'Item',
                        //style: TextStyle(fontSize: 10.0),
                        textAlign: TextAlign.start,
                      )
                    ]),
                    Column(children: [
                      Text(
                        'Price',
                        //style: TextStyle(fontSize: 10.0)
                      )
                    ]),
                    Column(children: [
                      Text(
                        'Quantity',
                        //style: TextStyle(fontSize: 10.0)
                      )
                    ]),
                    Column(children: [
                      Text(
                        'SubTotal',
                        // style: TextStyle(fontSize: 10.0)
                      )
                    ]),
                    Column(children: [
                      Text(
                        'Delete',
                        // style: TextStyle(fontSize: 10.0)
                      )
                    ]),
                  ]),
                ]),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CartTable(
                    itemName:
                        cartController.cartItem.values.toList()[index].name,
                    id: cartController.cartItem.keys.toList()[index],
                    price: cartController.cartItem.values.toList()[index].price,
                    quantity:
                        cartController.cartItem.values.toList()[index].quantity,
                    subtottal:
                        cartController.cartItem.values.toList()[index].subtotal,
                  );
                  // return CartItemTile(
                  //   id: cartController.cartItem.keys.toList()[index],
                  //   name: cartController.cartItem.values.toList()[index].name,
                  //   price: cartController.cartItem.values.toList()[index].price,
                  //   quantity:
                  //       cartController.cartItem.values.toList()[index].quantity,
                  //   subTotal:
                  //       cartController.cartItem.values.toList()[index].subtotal,
                  // );
                },
                itemCount: cartController.cartItem.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
