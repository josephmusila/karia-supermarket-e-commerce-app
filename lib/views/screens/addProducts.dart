import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/formController.dart';
import 'package:karia/model/ProductModel.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  var customlabelStyle = TextStyle(
    color: Colors.orange,
    fontWeight: FontWeight.bold,
  );

  final descriptionFocusNode = FocusNode();
  var editedProduct = Product(
      id: DateTime.now().toString(),
      quantity: 1,
      name: "",
      category: "",
      description: "",
      imageUrl: "",
      price: 0);

  final form = GlobalKey<FormState>();
  var formController = Get.put(FormController());
  final imageFocusNode = FocusNode();
  String initialValue = "Foods";
  var items = [
    "Foods",
    "Clothing",
    "Electronics",
    "Farm Tools",
    "Beauty",
    "Utensils"
  ];

  final priceFocusnode = FocusNode();
  final titleFocusNode = FocusNode();

  var _isLoading = false;

  void saveForm() {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }

    form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    print(editedProduct.id);
    print(editedProduct.name);
    print(editedProduct.category);
    print(editedProduct.description);
    print(editedProduct.imageUrl);
    print(editedProduct.price);

    formController.addProduct(editedProduct).catchError((error) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("An Error Occurred!"),
              content: Text("Something went wrong"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Okay"))
              ],
            );
          });
    }).then((value) {
      Navigator.of(context).pop();
      setState(() {
        _isLoading = false;
      });
    });
    form.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products '),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveForm,
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Form(
                key: form,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Product Name",
                            labelStyle: customlabelStyle,
                            errorStyle: TextStyle(
                              color: Colors.red,
                            )),
                        textInputAction: TextInputAction.next,
                        maxLines: 1,
                        //controller: formController.titleController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a product Name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          editedProduct = Product(
                              id: DateTime.now().toString(),
                              name: value!,
                              category: initialValue,
                              quantity: 1,
                              description: editedProduct.description,
                              imageUrl: editedProduct.imageUrl,
                              price: editedProduct.price);
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(titleFocusNode);
                        },
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Text(
                            "Category",
                            style: customlabelStyle,
                          ),
                          DropdownButton(
                            value: initialValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (newvalue) {
                              setState(() {
                                initialValue = newvalue.toString();
                              });
                            },
                            focusColor: Colors.amberAccent,
                            //style: customlabelStyle,
                            hint: Text("Select a category"),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Product Description",
                            labelStyle: customlabelStyle,
                            errorStyle: TextStyle(
                              color: Colors.red,
                            )),
                        textInputAction: TextInputAction.next,
                        maxLines: 3,
                        // controller: formController.descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a valid Description";
                          }
                          if (value.length < 10) {
                            return "Please provide atleast 10 characters";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          editedProduct = Product(
                              id: DateTime.now().toString(),
                              name: editedProduct.name,
                              quantity: 1,
                              category: initialValue,
                              description: value!,
                              imageUrl: editedProduct.imageUrl,
                              price: editedProduct.price);
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(descriptionFocusNode);
                        },
                      ),
                    ),
                    Card(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Product ImageUrl",
                            labelStyle: customlabelStyle,
                            errorStyle: TextStyle(
                              color: Colors.red,
                            )),
                        textInputAction: TextInputAction.next,
                        maxLines: 1,
                        //controller: formController.imageUrlController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter an Image Url";
                          }
                          if (!value.startsWith("http") &&
                              !value.startsWith("https")) {
                            return "Please enter a valid Url";
                          }
                          if (!value.endsWith(".png") &&
                              !value.endsWith(".jpg") &&
                              !value.endsWith(".jpeg")) {
                            return "Url should end with a .png or .jpg or jpeg  image extension";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          editedProduct = Product(
                              id: DateTime.now().toString(),
                              name: editedProduct.name,
                              category: initialValue,
                              quantity: 1,
                              description: editedProduct.description,
                              imageUrl: value!,
                              price: editedProduct.price);
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(imageFocusNode);
                        },
                      ),
                    ),
                    Card(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Product Price",
                            labelStyle: customlabelStyle,
                            errorStyle: TextStyle(
                              color: Colors.red,
                            )),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        // controller: formController.priceController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please provide product Price";
                          }
                          if (double.tryParse(value) == null) {
                            return "Please enter a valid number";
                          }
                          if (double.parse(value) < 0) {
                            return "Price cannot be a negative number";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          editedProduct = Product(
                              id: DateTime.now().toString(),
                              name: editedProduct.name,
                              category: initialValue,
                              quantity: 1,
                              description: editedProduct.description,
                              imageUrl: editedProduct.imageUrl,
                              price: double.parse(value!));
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(priceFocusnode);
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: saveForm,
                      child: Text("Submit"),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
