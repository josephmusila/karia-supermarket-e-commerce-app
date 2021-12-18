import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/formController.dart';
import 'package:karia/controller/screensController.dart';
import 'package:karia/views/customWidgets/customDrawer.dart';
import 'package:karia/views/customWidgets/manageProductsItem.dart';

import 'package:karia/views/screens/addProducts.dart';

class ManageProducts extends StatefulWidget {
  @override
  _ManageProductsState createState() => _ManageProductsState();
  
}

class _ManageProductsState extends State<ManageProducts> {
  var formController = Get.find<FormController>();
  var screenController = Get.find<ScreensController>();

    Future<void> _refreshProducts() async {
    await formController.fetchData();
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AddProducts());
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: CustomDrawer(),
      body: RefreshIndicator(
          onRefresh: _refreshProducts,
              child:screenController.isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: formController.productsList.length,
            itemBuilder: (context, index) {
              return ManageProductsItem(
                name: formController.productsList[index].name,
                imageUrl: formController.productsList[index].imageUrl,
                id: formController.productsList[index].id,
              );
            },
          ),
        ),
      ),
    );
  }
}
