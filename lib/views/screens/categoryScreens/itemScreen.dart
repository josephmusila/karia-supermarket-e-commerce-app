import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:karia/controller/cartController/cartController_controller.dart';
import 'package:karia/controller/formController.dart';
import 'package:karia/controller/screensController.dart';
import 'package:karia/views/customWidgets/cartCounter.dart';
import 'package:karia/views/customWidgets/customDrawer.dart';
import 'package:karia/views/customWidgets/productItem.dart';
import 'package:karia/views/screens/categoryScreens/alternativeScreen.dart';

// ignore: must_be_immutable
class ItemScreen extends StatefulWidget {
  ItemScreen(
      {required this.category,
      required this.name,
      required this.id,
      required this.quantity,
      required this.price,
      required this.imageUrl,
      required this.description});

  String description;
  String id;
  String imageUrl;
  String name;
  double price;
  int quantity;
  String category;

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  var cartController = Get.find<CartController>();

  var formController = Get.find<FormController>();

  var isLoading = false;

  var screenController = Get.find<ScreensController>();
  

  @override
  initState() {
    super.initState();
    screenController.checkList();
    screenController.getCategory(widget.category);
  }

  // ignore: unused_element
  Future<void> _refreshProducts() async {
    await formController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          CartCounter(),
        ],
      ),
      drawer: CustomDrawer(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(widget.description)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text("KSh ${widget.price.toString()} /="),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      child: Text("-"),
                      onPressed: () {
                        cartController.reduceItemQuantity(widget.id);
                        // cartController.addToCart(
                        //     widget.id,
                        //     widget.name,
                        //     widget.price,
                        //     int.parse(cartController.quantityCount.toString()));
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                          () => Text(cartController.quantityCount.toString())),
                    ),
                    ElevatedButton(
                      child: Text("+"),
                      onPressed: () {
                        cartController.addItemQuantity(widget.id);
                        // cartController.addToCart(
                        //     widget.id,
                        //     widget.name,
                        //     widget.price,
                        //     int.parse(cartController.quantityCount.toString()));
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Add to Cart"),
              onPressed: () {
                cartController.addToCart(widget.id, widget.name, widget.price,
                    int.parse(cartController.quantityCount.toString()));
              },
            ),
            Divider(),
            Container(
                height: 50,
                child: Center(
                  child: Text("Other related items",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                )),
            Divider(),
            Container(
              height: 500,
              child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: formController.productsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return index >= screenController.customList.length
                        ? Container()
                        : Container(
                            color: Colors.blueGrey,
                            padding: EdgeInsets.all(2),
                            child: GestureDetector(
                              onTap: () {
                                print("hello");
                                Get.to(() => AlternativeScreen(
                                    id: widget.id,
                                    description: widget.description,
                                    imageUrl: widget.imageUrl,
                                    name: widget.name,
                                    price: widget.price,
                                    category: widget.category,
                                    quantity: widget.quantity));
                              },
                              child: AlterNativeItem(
                                id: screenController.customList[index].id,
                                name: screenController.customList[index].name,
                                category:
                                    screenController.customList[index].category,
                                description: screenController
                                    .customList[index].description,
                                imageUrl:
                                    screenController.customList[index].imageUrl,
                                price: screenController.customList[index].price,
                                quantity:
                                    screenController.customList[index].quantity,
                              ),
                            ),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
