import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';
import 'package:karia/controller/orderHistoryController.dart';
import 'package:karia/views/customWidgets/customDrawer.dart';

class OrdersHistory extends StatefulWidget {
  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  var ordersController = Get.put(OrderHistoryController());

  void getList(Map<String, CartItem> item) {
    item.forEach((key, value) {
      print(value.name);
    });
  }

  void printItem() {
    ordersController.ittem.forEach((key, value) {
      print(value.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: const Text('Orders History'),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: ordersController.orderItem.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //printItem();
              ordersController.ittem.forEach((key, value) {
                print(value.name);
              });
            },
            child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: ListTile(
                  leading: Text(DateTime.now().toString()),
                )),
          );
        },
      ),
    );
  }
}
