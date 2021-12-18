import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/views/customWidgets/dasboardItem.dart';
import 'package:karia/views/screens/addProducts.dart';
import 'package:karia/views/screens/manageProducts.dart';

import '../homePage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(8),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Container(
              child: Center(
                child: Text(
                  "Admin Dashboard",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.black,
              height: 4,
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.deepOrange,
              child: Center(
                child: Text(
                  "*** Only For Administrators ***",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 4,
            ),
            Card(
              elevation: 5,
                          child: Container(
                  color: Colors.amberAccent,
                  height: 350,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.5,
                          crossAxisCount: 2),
                      children: [
                        DashBoardItem(
                          title: "Home",
                          iconData: Icons.home,
                          action: () {
                            Get.to(() => HomePage());
                          },
                        ),
                        DashBoardItem(
                          title: "Add Item",
                          iconData: Icons.add,
                          action: () {
                            Get.to(() => AddProducts());
                          },
                        ),
                        DashBoardItem(
                          title: "Manage Items",
                          iconData: Icons.receipt,
                          action: () {
                            Get.to(() => ManageProducts());
                          },
                        ),
                        DashBoardItem(
                          title: "Orders",
                          iconData: Icons.verified_user,
                          action: () {
                            Get.to(() => HomePage());
                          },
                        ),
                        DashBoardItem(
                          title: "CashFlow",
                          iconData: Icons.monetization_on,
                          action: () {
                            Get.to(() => HomePage());
                          },
                        ),
                        DashBoardItem(
                          title: "Admin",
                          iconData: Icons.admin_panel_settings,
                          action: () {
                            Get.to(() => HomePage());
                          },
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(height:10),
            Divider(color: Colors.black,),
            Container(
              height: 300,
              //child: ,
            )
          ],
        ),
      ),
    );
  }
}
