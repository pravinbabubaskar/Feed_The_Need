import 'package:feedthenead/donate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'UpiBill.dart';

class billPage extends StatefulWidget{

  final int bill;
  billPage({this.bill});

  @override

  billPageState createState() =>billPageState();

}

class billPageState extends State<billPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
          backgroundColor: Colors.white,
          title:Text("Confirm Your Order",style: TextStyle(
              fontFamily: 'Sans',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold),

          ),
          leading: IconButton(
            icon:Icon(Icons.arrow_back,color: Colors.teal[100],),
            onPressed: ()
            {
              Navigator.pop(context, false);
            },
          ),
          centerTitle: true),
body:
        Container(
          child:ListView(children: [
            GestureDetector(
                child:
                Card(
                  child:
                  ListTile(
                    title:Text( "Proceed Payment",style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),

                    subtitle:Text('Total Bill \₹'+((widget.bill)).toString(),style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 15,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                    ),

                  ),

                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => UpiBill(widget.bill.toDouble() ),

                      ));
                }


            ),


            GestureDetector(
                child:
                Card(
                  child:
                  ListTile(
                    title:Text( "Donate Us",style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),

                    subtitle:Text( "Donate NGO's to feed the needy people",style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 15,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                    ),

                  ),

                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => donate()

                      ));
                }


            ),

          ],),

        ),
        );
    throw UnimplementedError();
  }
}