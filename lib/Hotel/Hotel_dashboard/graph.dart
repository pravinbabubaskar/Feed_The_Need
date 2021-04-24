import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class graph extends StatefulWidget{
  final String _id;
  graph(this._id);
  @override
  graphState createState() => graphState();
}
class graphState extends State<graph>
{

 // Map<dynamic,dynamic> ItemList ;
  List<String> productName =new List();
  List<dynamic> quantity = new List();

  CollectionReference collection = FirebaseFirestore.instance.collection('hotel');


  void getUsersList(String id) async {
    var document =await FirebaseFirestore.instance.collection('hotel').get();
    for(var m in document.docs){
      if(m.id==id) {
        print(m.data()['product']);
        for(var values in m.data()['product']){
          productName.add(values['name']);
          quantity.add(values['quantity']);
        }

      }
    }
    print(productName);
    print(quantity);
  }
  @override

  void initState() {
    super.initState();
    getUsersList(widget._id);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
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