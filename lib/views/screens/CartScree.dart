import 'package:flutter/material.dart';
    
class CartScreen extends StatelessWidget {

  const CartScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Cart'),
      ),
      body: ListView(
              children: [
                Container(
                  child:Center(
                    child: Text("Total"),
                  )
                )
              ],
            ),
    );
  }
}