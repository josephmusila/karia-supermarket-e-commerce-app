import 'package:get/get.dart';
import 'package:karia/controller/cartController/cartController_controller.dart';

class Order {
  late String id;
  late Map<String, CartItem> addedItem;

  Order({required this.id, required this.addedItem});
}

class OrderHistoryController extends GetxController {
  List orderItem = [];
  Map<String, CartItem> ittem = {};

  void addOrder(String id, Map<String, CartItem> item) {
    orderItem.add(item);
  }
  
  // void newOrder(String id, Map<String, CartItem> item){
  //   ittem.forEach((id, value) { })
  // }
}
