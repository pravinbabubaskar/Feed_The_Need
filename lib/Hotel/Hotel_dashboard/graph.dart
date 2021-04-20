
import 'package:flutter/material.dart';

class graph extends StatefulWidget{
  @override
  graphstate createState() => graphstate();
}
class graphstate extends State<graph>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('Food Wasted Graph',
          style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Southern',
          color: Colors.blueGrey,
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
              'Graph',
              textAlign:TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                color: Colors.blueGrey,

              ),
              //  textAlign: TextAlign.center
            ),
            Icon(
              Icons.bar_chart,
              //size: TextAlign.left,
              size: 40,
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