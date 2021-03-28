import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/widgets/custom_text.dart';
import 'package:feedthenead/widgets/small_floating_button.dart';
import 'package:flutter/material.dart';

import 'Hotel_dashboard/dashboard.dart';
import 'Hotel_dashboard/order.dart';
import 'Hotel_dashboard/product.dart';
import 'add_product.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hasImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: primary,
        title: CustomText(
          text: "Home_page",
          color: white,
        ),
        actions: <Widget>[],
      ),
      drawer: Drawer(child: Dashboard()),
      backgroundColor: white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
//                  Positioned.fill(
//                      child: Align(
//                        alignment: Alignment.center,
//                        child: Loading(),
//                      )),

              // restaurant image
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                  child: imageWidget(hasImage: hasImage)),

              // fading black
              Container(
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.025),
                      ],
                    )),
              ),

              //restaurant name
              Positioned.fill(
                  bottom: 30,
                  left: 10,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomText(
                        text: "name",
                        color: white,
                        size: 24,
                        weight: FontWeight.normal,
                      ))),

              // average price
              Positioned.fill(
                  bottom: 10,
                  left: 10,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomText(
                        text: "Average Price",
                        color: white,
                        size: 16,
                        weight: FontWeight.w300,
                      ))),

              Positioned.fill(
                  bottom: 2,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow[900],
                                size: 20,
                              ),
                            ),
                            Text("rating"),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(-2, -1),
                          blurRadius: 5),
                    ]),
                child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Order()));
                    },
                    leading: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset("images/delivery.png"),
                    ),
                    title: CustomText(
                      text: "Orders",
                      size: 24,
                    ),
                    trailing: CustomText(
                      text: "+",
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(-2, -1),
                          blurRadius: 5),
                    ]),
                child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Product()));
                    },
                    leading: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset("images/fd.png"),
                    ),
                    title: CustomText(
                      text: "Products",
                      size: 24,
                    ),
                    trailing: CustomText(
                      text: "+",
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ),
            ),
          ),

          // products
          Column()
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Add_product()));
        },
        child: Icon(Icons.add),
        backgroundColor: primary,
        tooltip: 'Add Product',
      ),
    );
  }

  Widget imageWidget({bool hasImage, String url}) {
    if (hasImage)
      return FadeInImage.memoryNetwork(
        placeholder: null,
        image: url,
        height: 160,
        fit: BoxFit.fill,
        width: double.infinity,
      );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                size: 40,
              ),
            ],
          ),
          CustomText(text: "No Photo")
        ],
      ),
      height: 160,
    );
  }
}
