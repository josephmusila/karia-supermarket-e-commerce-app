import 'package:get/get.dart';
import './cartController_controller.dart';

class CartControllerBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CartController());
    }
}