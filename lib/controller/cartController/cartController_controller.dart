// ignore_for_file: unnecessary_statements

import 'dart:core';

import 'package:get/get.dart';


class CartItem {
  String name;
  double price;
  var quantity = 1;
  String id;
  double subtotal;

  CartItem({
    required this.name,
    required this.id,
    required this.quantity,
    required this.price,
    required this.subtotal,
  });
}

class CartController extends GetxController {
  var itemCounter = 0.obs;
  var quantityCount = 1.obs;

  var itemSubTotal = 0.0.obs;
  Map<String, CartItem> cartItem = {};

  Map<String, CartItem> get item {
    return {...cartItem};
  }

  void addToCart(String prodId, String name, double price, int quantity) {
    if (cartItem.containsKey(prodId)) {
      cartItem.update(
          prodId,
          (existingProduct) => CartItem(
              id: existingProduct.id,
              name: existingProduct.name,
              price: existingProduct.price,
              quantity: int.parse(quantityCount.toString()),
              subtotal: ((int.parse(quantityCount.toString())) *
                  existingProduct.price)));
    } else {
      cartItem.putIfAbsent(
          prodId,
          () => CartItem(
              id: prodId,
              name: name,
              price: price,
              quantity: int.parse(quantityCount.toString()),
              subtotal: (price * int.parse(quantityCount.toString()))));
      itemCounter++;
    }
  }

  var subtotal = 0.00;
  void getSubtotal() {}

  void addItemQuantity(String id) {
    quantityCount.value++;
    itemSubTotal = cartItem["subtotal"] as RxDouble;
  }

  void reduceItemQuantity(String id) {
    quantityCount.value == 0 ? 1 : quantityCount.value--;
    itemSubTotal = cartItem["subtotal"] as RxDouble;
  }

  void updateSubtotal(String id) {
    cartItem.update(
        id,
        (value) => CartItem(
            id: value.id,
            name: value.name,
            price: value.price,
            quantity: value.quantity,
            subtotal: (value.price * value.quantity)));
  }

  //var finalAmount = 0.0 as RxDouble;

  double get totalAmount {
    var total = 0.00;
    cartItem.forEach((key, cartItem) {
      //total+=(
      //(int.parse(cartItem.price.toString()))*((int.parse(cartItem.quantity.toString()))));
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void removeItem(String productId) {
    itemCounter.value--;
    cartItem.remove(productId);
  }

  void clearCart() {
    itemCounter.value = 0;
    cartItem = {};
  }
}
