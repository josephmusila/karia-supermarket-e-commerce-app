import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';
import 'package:karia/controller/cartController/cartController_page.dart';
import 'package:karia/controller/formController.dart';

// ignore: must_be_immutable
class CartCounter extends StatelessWidget {
  var formController = Get.find<FormController>();
  var cartController = Get.put(CartController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() {
          return CartControllerPage();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart_rounded, color: Colors.black),
              onPressed: () {
                Get.to(() {
                  
                  return CartControllerPage();
                  
                });
              },
            ),
            Positioned(
                top: 10,
                bottom: 10,
                child: Obx(
                  () => Text(
                    cartController.itemCounter.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
