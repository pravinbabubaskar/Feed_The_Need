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
        //title: Text("NEAR ME"),
        backgroundColor: Colors.white,

        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(loc1,style: TextStyle(fontFamily: 'Sans',color: Colors.black),textAlign: TextAlign.left,),
      ),
      body: Center(child: Text("")
        //iconTheme: Icons.rice_bowl,
      ),
    );
  }
}
