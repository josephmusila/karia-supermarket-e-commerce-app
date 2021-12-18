import 'dart:convert';

import 'package:get/get.dart';
import 'package:karia/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class FormController extends GetxController {
  var items = [
    "Foods",
    "Clothing",
    "Electronics",
    "Farm Tools",
    "Beauty",
    "Utensils"
  ];

  List<Product> productsList = [];
  //var allprodsList = [].obs;

  Future<void> addProduct(Product product) async {
    final cat = product.category;

    final url = "https://shop-4c150-default-rtdb.firebaseio.com/$cat.json";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "name": product.name,
          "category": product.category,
          "description": product.description,
          "imageUrl": product.imageUrl,
          "price": product.price,
        }),
      );

      final newProduct = Product(
          id: json.decode(response.body)["name"],
          name: product.name,
          description: product.description,
          category: product.category,
          quantity: product.quantity,
          imageUrl: product.imageUrl,
          price: product.price);

      productsList.add(newProduct);
      //allprodsList.add(newProduct);
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> fetchData() async {
    const foodUrl = "https://shop-4c150-default-rtdb.firebaseio.com/Foods.json";
    const electronicsUrl =
        "https://shop-4c150-default-rtdb.firebaseio.com/Electronics.json";

    const clothingUrl =
        "https://shop-4c150-default-rtdb.firebaseio.com/Clothing.json";
    const utensilsUrl =
        "https://shop-4c150-default-rtdb.firebaseio.com/utensils.json";

     const beautyUrl = "https://shop-4c150-default-rtdb.firebaseio.com/Beauty.json";

    const farmUrl = "https://shop-4c150-default-rtdb.firebaseio.com/Farm%20Tools.json";
    // const url = "https://shop-4c150-default-rtdb.firebaseio.com/Foods.json";
    // const url = "https://shop-4c150-default-rtdb.firebaseio.com/Foods.json";

    var urlList = [foodUrl, electronicsUrl, clothingUrl, utensilsUrl,beautyUrl,farmUrl];

    for (var i = 0; i < urlList.length; i++) {
      try {
        final response = await http.get(Uri.parse(urlList[i]));
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        final List<Product> addedProducts = [];
        extractedData.forEach((prodId, prodData) {
          addedProducts.add(Product(
              id: prodId,
              name: prodData["name"],
              description: prodData["description"],
              category: prodData["category"],
              quantity: 1,
              imageUrl: prodData["imageUrl"],
              price: prodData["price"]));
        });
      
        //productsList = addedProducts;
        addedProducts.forEach((element) {
          productsList.add(element);
        });
        print(json.decode(response.body));
        print(productsList.length);
      } catch (error) {
        throw (error);
      }
    }
  }

  void printProducts() {
    for (var i = 0; i < productsList.length; i++) {
      print(productsList[i].name);
    }
  }

  Future<void> upDateProduct(String id, Product newProduct) async {
    final prodIndex = productsList.indexWhere((element) => element.id == id);
    final url = "https://shop-4c150-default-rtdb.firebaseio.com/foods/$id.json";
    await http.patch(Uri.parse(url),
        body: json.encode({
          "name": newProduct.name,
          "description": newProduct.description,
          "category": newProduct.category,
          "imageUrl": newProduct.imageUrl,
          "price": newProduct.price
        }));
    if (prodIndex >= 0) {
      productsList[prodIndex] = newProduct;
    } else {
      print("...............");
    }
  }

  void deleteItem(String id) {
    final url = "https://shop-4c150-default-rtdb.firebaseio.com/Foods/$id.json";

    final existingProductIndex =
        productsList.indexWhere((element) => element.id == id);
    var existingProduct = productsList[existingProductIndex];
    productsList.removeAt(existingProductIndex);

    http.delete(Uri.parse(url)).then((_) {
      existingProduct = null as Product;
    }).catchError((_) {
      productsList.insert(existingProductIndex, existingProduct);
    });

    //allprodsList = productsList as RxList;
  }
}
