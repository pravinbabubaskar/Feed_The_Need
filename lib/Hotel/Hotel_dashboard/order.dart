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
          title: Text("order"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/order.jpg'),
            Text(
              'No More Waste',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                letterSpacing: -1,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              "No Orders right now..",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Sans",
                letterSpacing: -1,
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ));
  }
}
