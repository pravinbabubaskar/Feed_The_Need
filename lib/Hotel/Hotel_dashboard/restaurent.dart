import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Restaurent extends StatefulWidget {
  @override
  _RestaurentState createState() => _RestaurentState();
}

class _RestaurentState extends State<Restaurent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Restaurent"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
