import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/views/screens/addProducts.dart';
import 'package:karia/views/screens/categoryScreens/contacts.dart';
import 'package:karia/views/screens/dashBoard.dart';
import 'package:karia/views/screens/manageProducts.dart';
import 'package:karia/views/screens/ordersHistory.dart';
import "../homePage.dart";

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Get.to(HomePage());
              },
            ),
            Divider(
              color: Colors.deepOrange,
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Add Products"),
              onTap: () {
                Get.to(AddProducts());
              },
            ),
            Divider(
              color: Colors.deepOrange,
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Orders History"),
              onTap: () {
                Get.to(OrdersHistory());
              },
            ),
            Divider(
              color: Colors.deepOrange,
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text("Admin Dashboard"),
              onTap: () {
                Get.to(() => DashBoard());
              },
            ),
            Divider(
              color: Colors.deepOrange,
            ),
            ListTile(
              leading: Icon(Icons.perm_phone_msg_sharp),
              title: Text("Contacts"),
              onTap: () {
                Get.to(() => Contacts());
              },
            ),
            Divider(
              color: Colors.deepOrange,
            ),
            ListTile(
              leading: Icon(Icons.task_rounded),
              title: Text("Terms & Conditions"),
              onTap: () {},
            ),
            Divider(
              color: Colors.deepOrange,
            ),
            //  Container(
            //     color: Colors.white.withOpacity(0.5),
            //     margin: EdgeInsets.symmetric(horizontal: 10),
            //     height: 300,
            //     child: ListView(
            //       children: [
            //         Container(
            //           child: Center(
            //             child: Text(
            //               "Categories",
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.deepOrange,
            //               ),
            //             ),
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.amberAccent,
            //           height: 5,
            //         ),
            //         Card(
            //           child: ListTile(
            //             leading: Text("Food Stuffs"),
            //             trailing: Icon(Icons.arrow_forward_ios),
            //             onTap: () {
            //               Get.to(() => CategoryScreen(title: "Food Stuffs", category: 'Foods',));
            //             },
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.amberAccent,
            //           height: 5,
            //         ),
            //         Card(
            //           child: ListTile(
            //             leading: Text("Electronics"),
            //             trailing: Icon(Icons.arrow_forward_ios),
            //             onTap: () {
            //               Get.to(() => CategoryScreen(title: "Electronics", category: 'Electronics',));
            //             },
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.amberAccent,
            //           height: 5,
            //         ),
            //         Card(
            //           child: ListTile(
            //             leading: Text("Utensils"),
            //             trailing: Icon(Icons.arrow_forward_ios),
            //             onTap: () {
            //               Get.to(() => CategoryScreen(title: "Utensils", category: 'Utensils',));
            //             },
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.amberAccent,
            //           height: 5,
            //         ),
            //         Card(
            //           child: ListTile(
            //             leading: Text("Clothing"),
            //             trailing: Icon(Icons.arrow_forward_ios),
            //             onTap: () {
            //               Get.to(()=>CategoryScreen(title: "Clothing", category: 'Clothing',));
            //             },
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.amberAccent,
            //           height: 5,
            //         ),
            //         Card(
            //           child: ListTile(
            //             leading: Text("Beauty"),
            //             trailing: Icon(Icons.arrow_forward_ios),
            //             onTap: () {
            //               Get.to(() => CategoryScreen(title: "Beauty Products", category: 'Beauty',));
            //             },
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.amberAccent,
            //           height: 5,
            //         ),
            //         Card(
            //           child: ListTile(
            //             leading: Text("Farm Tools"),
            //             trailing: Icon(Icons.arrow_forward_ios),
            //             onTap: () {
            //               Get.to(() => CategoryScreen(title: "Farm Tools", category: 'Farm Tools',));
            //             },
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.amberAccent,
            //           height: 5,
            //         ),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
