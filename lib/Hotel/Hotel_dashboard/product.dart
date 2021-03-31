import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedthenead/Hotel/home.dart';
import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String _id;

  Product(this._id);
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('hotel');
//Stream collectionStream = FirebaseFirestore.instance.collection('users').snapshots();
    // Stream documentStream =  FirebaseFirestore.instance.collection('hotel').doc(_id).snapshots();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          backgroundColor: white,
          elevation: 0.0,
          title: CustomText(
            text: "products",
            size: 20,
          ),
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home(_id)));
              }),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: users.doc(_id).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // get product document
                var product = snapshot.data['product'];

                // build list using names from product
                return ListView.builder(
                    itemCount: product != null ? product.length : 0,
                    itemBuilder: (_, int index) {
                      print(product[index]['name']);
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 4, right: 4, top: 4, bottom: 10),
                        child: Container(
                          height: 110,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(-2, -1),
                                    blurRadius: 5),
                              ]),
//          height: 160,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    product[index]['p_url'],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomText(
                                            text: product[index]['name'],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Row(
                                        children: <Widget>[
                                          CustomText(
                                            text: "from: ",
                                            color: grey,
                                            weight: FontWeight.w300,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                              onTap: () async {},
                                              child: CustomText(
                                                text: product[index]
                                                    ['description'],
                                                color: primary,
                                                weight: FontWeight.w300,
                                                size: 14,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Icon(
                                                Icons.star,
                                                color: red,
                                                size: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: CustomText(
                                                text: "rating",
                                                color: grey,
                                                size: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: CustomText(
                                            text:
                                                "price : ${product[index]['price']}",
                                            weight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Container();
              }
            }));
  }
}
