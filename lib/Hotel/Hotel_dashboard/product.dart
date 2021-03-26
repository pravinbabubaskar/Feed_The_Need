import 'package:feedthenead/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:feedthenead/helpers/style.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          backgroundColor: white,
          elevation: 0.0,
          title: CustomText(text: "Products"),
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
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
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: "name",
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
                                  text: "res",
                                  color: primary,
                                  weight: FontWeight.w300,
                                  size: 14,
                                )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: "rating",
                                  color: grey,
                                  size: 14.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(
                              text: "price",
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
        ));
  }
}
