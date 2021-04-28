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
      backgroundColor: Colors.teal[100],
      bottomNavigationBar: Stack(
        children: [

          Container(
            //margin: EdgeInsets.all(5.0),
            //padding: const EdgeInsets.all(5),
            child: Image(image: NetworkImage('https://b8g9x2x5.rocketcdn.me/wp-content/uploads/2018/08/robot-shopping-commerce-ai-ss-1920_p9zldb.gif'),
            ),//asset('images/bill2crp.png'),
            height: 500.0,
            alignment:Alignment.center,
            width:600.0,
          ),

        ],
      ),
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

          ],)
        ),
        );
    throw UnimplementedError();
  }
}