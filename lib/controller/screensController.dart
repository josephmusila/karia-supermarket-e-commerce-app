import 'package:get/get.dart';
import 'package:karia/controller/formController.dart';
import 'package:karia/model/ProductModel.dart';

class ScreensController extends GetxController {
  var formController = Get.find<FormController>();
  
  var isLoading = false;

  void checkList() {
    if (formController.productsList.length == 0) {
      isLoading = true;
    } else {
      isLoading = false;
    }
  }

  var customListCategory = "";
  List<Product> customList = [];

  void getCategory(String customListCategory) {
    formController.productsList.forEach((element) {
      if (element.category == customListCategory) {
        customList.add(element);
        for (var i = 0; i < customList.length; i++) {
          // ignore: unnecessary_null_comparison
          if (customList[i] == null) {
            customList.removeWhere((element) {
              // ignore: unrelated_type_equality_checks
              return element.category != customList;
            });
          }
        }
      }
    });
  }
}
