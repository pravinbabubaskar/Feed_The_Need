import 'package:flutter/material.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("CART",
        style: TextStyle(
        //fontFamily: "impress",
        color: Colors.blueGrey,
        //fontSize: 15,
      ),
      ),
    ),
    );
  }
}
