import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';
import 'package:karia/controller/orderHistoryController.dart';
import 'package:karia/views/screens/ordersHistory.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var cartController = Get.find<CartController>();
  var customlabelStyle = TextStyle(
    color: Colors.orange,
    fontWeight: FontWeight.bold,
  );

  var initialValue = "Mpesa";
  var orderHistoryController =
      Get.put(OrderHistoryController(), permanent: true);

  var paymentMethods = [
    "Mpesa",
    "Airtel Money",
    "PayPal",
    "Skrill",
    "Western union",
    "Telkom Money"
  ];

  var locations = [
    "CBD",
    "Lucky Summer",
    "Ngara",
    "Westlands",
    "Muthaiga",
    "Dandora"
  ];
  var inittialLocation ="Dandora";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Payments'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Text("Select Your Payment Method",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.amberAccent,
                )),
            SizedBox(height: 5),
            DropdownButton(
              value: initialValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: paymentMethods.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  initialValue = newvalue.toString();
                });
              },
              focusColor: Colors.amberAccent,
              //style: customlabelStyle,
              hint: Text("Select a Payment Method"),
            ),
            Divider(
              color: Colors.white,
              height: 3,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Card/Phone Number",
                      labelStyle: customlabelStyle,
                      errorStyle: TextStyle(
                        color: Colors.red,
                      )),
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  //controller: formController.titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a Card/Phone Number";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              height: 3,
            ),
            SizedBox(height: 20),
            Text(
                "Payable Amount ${cartController.totalAmount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amberAccent,
                )),
            Divider(
              color: Colors.white,
              height: 3,
            ),
            SizedBox(height: 20),
            SizedBox(height: 25),
            Text("Select Your Pick Up Point ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.amberAccent,
                )),
            SizedBox(height: 5),
            DropdownButton(
              value: inittialLocation,
              icon: Icon(Icons.keyboard_arrow_down),
              items: locations.map((String locations) {
                return DropdownMenuItem(
                  value: locations,
                  child: Text(locations),
                );
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  inittialLocation = newvalue.toString();
                });
              },
              focusColor: Colors.amberAccent,
              //style: customlabelStyle,
              //hint: Text("Select a Payment Method"),
            ),
            Divider(
              color: Colors.white,
              height: 3,
            ),
            ElevatedButton(
              onPressed: () {
                cartController.clearCart();
                orderHistoryController.addOrder(
                    DateTime.now().toString(), cartController.cartItem);
                print(orderHistoryController.orderItem);
                //Get.to(() => OrdersHistory());
                Get.off(() => OrdersHistory());
                Get.snackbar(
                  "Order Added Succesfully",
                  "Check Your Email For Confirmation",
                  duration: Duration(seconds: 5),
                );
              },
              child: Text("Order Now"),
            )
          ],
        ),
      ),
    );
  }
}
