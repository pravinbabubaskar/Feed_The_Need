import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) {
            return ListTile(
              leading: CustomText(
                text: "order",
                weight: FontWeight.bold,
              ),
              title: Text("name"),
              subtitle: Text("date"),
            );
          }),
    );
  }
}
