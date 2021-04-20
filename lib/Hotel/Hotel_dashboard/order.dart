import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/home.dart';
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
          title: CustomText(
            text: "Orders",
            size: 20,
          ),
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
                //  Navigator.pop(context);

                //  Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Home(_id)));
              }),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/delivery.png',
              height: 150,
              width: double.infinity,
            ),
            Text(
              'No Orders right now..',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                letterSpacing: -1,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              "Wait for Orders",
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
