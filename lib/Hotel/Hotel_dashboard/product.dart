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
        title: Text("Product_page"),
      ),
    );
  }
}
