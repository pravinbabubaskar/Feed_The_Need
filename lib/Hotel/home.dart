import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hotel_homepage",
            style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 10,
        ),

      ),
      ),
    );
  }
}
