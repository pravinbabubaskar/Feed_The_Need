import 'package:flutter/material.dart';

class View_detail extends StatefulWidget {
  @override
  _View_detailState createState() => _View_detailState();
}

class _View_detailState extends State<View_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" completed orders details"),
      ),
    );
  }
}
