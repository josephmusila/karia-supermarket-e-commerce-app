import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karia/controller/formController.dart';
import 'package:karia/controller/screensController.dart';

import 'package:karia/views/screens/categoryScreens/categoryScreen.dart';

import 'customWidgets/cartCounter.dart';
import 'customWidgets/customDrawer.dart';
import 'customWidgets/fProduct.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var primaryColor = Colors.blue;
  var themeData = ThemeData(
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
  );

  var formController = Get.put(FormController(),permanent:true);
  var screenController = Get.put(ScreensController());

  var _isInit = true;
  var isloading = false;

  //animation variable;
  var opacity =1.0;
  var width = 200.0;
  var height = 0.0;
  var margin = 50.0;
  var animationDuration = Duration(seconds: 1);
  //

  @override
  void initState() {
    if (_isInit) {
      setState(() {
        isloading = true;
      });
      formController.fetchData().then((_) {
        setState(() {
          isloading = false;
        });
      });
    }
    _isInit = false;
    super.initState();

    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        width = double.infinity;
        opacity = 1;
        margin = 10;
        //height=400;
      });
    });
  }

  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 5.0,
            title: Text("Karia Supermarket",
                style: TextStyle(
                  fontSize: 14,
                )),
            actions: [
              CartCounter(),
              IconButton(
                icon: Icon(Icons.account_circle_outlined),
                onPressed: () {
                  formController.printProducts();
                },
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            bottom: PreferredSize(
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Search for products and Categories",
                              hintStyle: TextStyle(
                                fontSize: 10,
                              ))),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          color: Colors.orangeAccent,
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ))
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(50),
            ),
            backgroundColor: Colors.amberAccent),
        drawer: CustomDrawer(),
        body: Container(
          height: double.infinity,
          // color: Colors.amberAccent,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/online-shopping.jpeg"),
            fit: BoxFit.cover,
          )),
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  //height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        //olor: Colors.white.withOpacity(0.25),
                        child: Text(
                          "Welcome To The Largest Online Shopping Site",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              background: Paint()
                                ..color = Colors.white.withOpacity(0.25)),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  )),
              AnimatedOpacity(
                duration: animationDuration,
                opacity: opacity,
                child: AnimatedContainer(
                  duration: animationDuration,
                  color: Colors.white.withOpacity(0.5),
                  margin: EdgeInsets.all(margin),
                  height: 400,
                  //  width: width,
                  child: ListView(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.amberAccent,
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Text("Food Stuffs"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Get.off(CategoryScreen(
                              title: "Food Stuffs",
                              category: 'Foods',
                            ));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.amberAccent,
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Text("Electronics"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            //Get.off(CategoryScreen(title: "Electronics", category: 'Electronics',));
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => CategoryScreen(
                                          title: "Electronics",
                                          category: 'Electronics',
                                        )));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.amberAccent,
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Text("Utensils"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Get.to(() => CategoryScreen(
                                  title: "Utensils",
                                  category: 'Utensils',
                                ));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.amberAccent,
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Text("Clothing"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Get.to(() => CategoryScreen(
                                  title: "Clothing",
                                  category: 'Clothing',
                                ));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.amberAccent,
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Text("Beauty"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Get.to(() => CategoryScreen(
                                  title: "Beauty Products",
                                  category: 'Beauty',
                                ));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.amberAccent,
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Text("Farm Tools"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Get.to(() => CategoryScreen(
                                  title: "Farm Tools",
                                  category: 'Farm Tools',
                                ));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.amberAccent,
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: margin),
                color: Colors.amberAccent,
                child: Center(
                  child: (Text(
                    "Featured Products",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
              Fproduct(isloading: isloading, formController: formController),
            ],
          ),
        ));
  }
}
