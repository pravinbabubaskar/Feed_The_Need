import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'account.dart';

class Past_order extends StatefulWidget{
  @override
  pastorder createState() => pastorder();
}
class pastorder extends State<Past_order>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('YOUR PAST ORDERS',style: TextStyle(),),
          centerTitle: true,
      ),
      body:Center(

      child:Text(
           'your orders',
          textAlign:TextAlign.center,
          style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
          color: Colors.blueGrey
          ),
    ),
           //),
          ),

    );
    //throw UnimplementedError();
  }

}