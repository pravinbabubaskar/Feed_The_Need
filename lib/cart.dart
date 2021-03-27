import 'package:flutter/material.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/cart.png'),
        Text('No More Waste',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Poppins",
            letterSpacing: -1,
            color: Colors.black,
            fontSize: 20,
          ),),
        Text("Your cart is empty. Add something from the menu",
          textAlign: TextAlign.center,
          style: TextStyle(
          fontFamily: "Sans",
          letterSpacing: -1,
          color: Colors.grey,
          fontSize: 20,
        ),
        ),
      ],
    );
  }
}
