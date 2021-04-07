import 'dart:ffi';
import 'dart:typed_data';
import 'dart:async';
import 'UpiPayment.dart';
import 'package:flutter/material.dart';
import 'UpiBill.dart';

class billPage extends StatefulWidget {
  final int bill;
  billPage({this.bill});

  @override
  billPageState createState() => billPageState();
}

class billPageState extends State<billPage> {
  //var bill=super.bill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "Confirm Your Order" /*(widget.bill+(widget.bill*0.1)).toString()*/,
            style: TextStyle(
                fontFamily: 'Sans',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Container(
        child: GestureDetector(
            child: Card(
              child: ListTile(
                title: Text(
                  "Proceed Payment",
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Total Bill \₹' +
                      ((widget.bill + (widget.bill * 0.1))).toString(),
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 15,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UpiBill((widget.bill * 0.1) + widget.bill),
                  ));
            }),
      ),
    );
    throw UnimplementedError();
  }
}
