import 'package:flutter/material.dart';

class Order_detail extends StatefulWidget {
  @override
  _Order_detailState createState() => _Order_detailState();
}

class _Order_detailState extends State<Order_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Order details"),
      ),
    );
  }
}
