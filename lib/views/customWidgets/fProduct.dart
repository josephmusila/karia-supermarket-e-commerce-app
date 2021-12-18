import 'package:flutter/material.dart';
import 'package:karia/controller/formController.dart';
import 'package:karia/views/customWidgets/productItem.dart';

class Fproduct extends StatelessWidget {
  const Fproduct({
    Key? key,
    required this.isloading,
    required this.formController,
  }) : super(key: key);

  final bool isloading;
  final FormController formController;
 

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        color: Colors.white,
        width: double.infinity,
        child: isloading?Card(
          elevation: 5,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                margin: EdgeInsets.all(10),
                child: Text("Loading Items...",style:TextStyle(
                  fontWeight:FontWeight.bold,
                ))),
              CircularProgressIndicator(
                backgroundColor: Colors.red,
                color: Colors.yellow,
                strokeWidth: 10,
                semanticsValue: "hello",
                //value: 0.6,
              )
            ],
          )
          )
         :  GridView.builder(
          itemCount: formController.productsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {

              return ProductItem(
                id: formController.productsList[index].id,
                name: formController.productsList[index].name,
                category: formController.productsList[index].category,
                description:
                    formController.productsList[index].description,
                imageUrl: formController.productsList[index].imageUrl,
                price: formController.productsList[index].price,
                quantity: formController.productsList[index].quantity,
              );


            
          },
        ));
  }
}
