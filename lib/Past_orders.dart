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
      //backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('YOUR PAST ORDERS',style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
          color: Colors.black,
        ),
        ),
          centerTitle: true,
      ),
      body:Center(
        //backgroundColor: Colors.white,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          //child:Center(
        //    child:
        Text(
           'your orders',
          textAlign:TextAlign.center,
          style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
          color: Colors.blueGrey,

          ),
        //  textAlign: TextAlign.center
      ),
          Icon(
            Icons.access_alarms,
            //size: TextAlign.left,
            color: Colors.blueGrey,
          ),
       // ),
        ],
      ),
           ),



    );
    //throw UnimplementedError();
  }

}