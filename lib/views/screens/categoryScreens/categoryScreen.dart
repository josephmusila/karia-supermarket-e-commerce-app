import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';
import 'package:karia/controller/formController.dart';
import 'package:karia/controller/screensController.dart';
import 'package:karia/views/customWidgets/cartCounter.dart';
import 'package:karia/views/customWidgets/customDrawer.dart';
import 'package:karia/views/customWidgets/productItem.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  String category;
  String title;

  CategoryScreen({required this.category, required this.title});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var formController = Get.find<FormController>();
  var isLoading = false;
  var screenController = Get.find<ScreensController>();
  var cartController = Get.find<CartController>();

  @override
  initState() {
    super.initState();
    
    screenController.checkList();
   // screenController.getCategory(widget.category);
    setState(() {
      
    });
  }

  Future<void> _refreshProducts() async {
    await formController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          CartCounter(),
        ],
      ),
      drawer: CustomDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: screenController.isLoading
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
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
                      : ProductItem(
                          id: screenController.customList[index].id,
                          name: screenController.customList[index].name,
                          category: screenController.customList[index].category,
                          description:
                              screenController.customList[index].description,
                          imageUrl: screenController.customList[index].imageUrl,
                          price: screenController.customList[index].price,
                          quantity: screenController.customList[index].quantity,
                        );
                }),
      ),
    );
  }
}
