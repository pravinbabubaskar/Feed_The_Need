//import 'package:feedthenead/Past_orders.dart';
import 'package:feedthenead/data.dart';
import 'package:flutter/material.dart';
import 'package:feedthenead/home.dart';
import 'dart:async';

class bill extends StatefulWidget {
  double pay;
  @override
  bill(this.pay);
  billState createState() => new billState();
}

class billState extends State<bill> {
  int count;
  Timer _t;

  void _startTimer() {
    count = 10;
    if (_t != null) {
      _t.cancel();
    }
    _t = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (count > 0) {
          count--;
        } else {
          _t.cancel();
          ShowAlert(context);
        }
      });
    });
  }

  ShowAlert(BuildContext context) {
    // Create button
    Widget ok = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                  location: loc1,
                )));
      },
    );

    AlertDialog a = AlertDialog(
      title: Text("Time Out"),
      content: Text("Your Order Confirmed."),
      actions: [
        ok,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return a;
      },
    );
  }



  ShowAlertCancel(BuildContext context) {
    // Create button
    Widget cancel = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                  location: loc1,
                )));
      },
    );

    AlertDialog a = AlertDialog(
      title: Text("Cancel"),
      content: Text("Your Order Cancelled."),
      actions: [
        cancel,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return a;
      },
    );
  }
  @override
  void initState(){
    _startTimer();
}
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text("Order Confirmation",
          style: TextStyle(
            fontFamily: 'Impress',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("CONFIRMING ORDER",
              style: TextStyle(
                fontFamily: 'Impress',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            Text("please wait...",
              style: TextStyle(
                fontFamily: 'Sans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),

            Text(
              '$count',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            RaisedButton(
              onPressed: () {
                _t.cancel();
                ShowAlertCancel(context);
              },
              child: Text("Cancel Order"),
            ),
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }
//@override

}



