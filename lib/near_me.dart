import 'package:flutter/material.dart';
import 'data.dart';


class NearMe extends StatefulWidget {
  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(loc1,style: TextStyle(fontFamily: 'Sans',color: Colors.black),textAlign: TextAlign.left,),
      ),
      body: Center(child: Text("")),
    );
  }
}