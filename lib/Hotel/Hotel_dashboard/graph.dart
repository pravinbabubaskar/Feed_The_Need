import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class graph extends StatefulWidget {
  final String _id;
  graph(this._id);
  @override
  graphState createState() => graphState();
}

class graphState extends State<graph> {
  List ItemList = [];

  CollectionReference collection =
      FirebaseFirestore.instance.collection('hotel');
  //= profileList.doc(widget._id);

  Future getUsersList(String id) async {
    List itemsList = [];

    try {
      DocumentSnapshot s = await collection.doc(id).get();
      itemsList = s.get('product');
      /*.then((querySnapshot) {
       querySnapshot.docs.forEach((element) {
       itemsList.add(element.get("name"));
      });
      });*/
      print(
          "                        =X=X=X=   Success   =X=X=X=                        ");
      print(itemsList);
      print(itemsList.length);
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  /*void init()
  {
    CollectionReference users = FirebaseFirestore.instance.collection('hotel');
    DocumentReference docref = users.doc(widget._id);

  }*/
  fetchDatabaseList() async {
    List resultant = await getUsersList(widget._id);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        ItemList = resultant;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Food Wasted Graph',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Southern',
            color: Colors.blueGrey,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        //backgroundColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //child:Center(
            //    child:
            Text(
              'Graph',
              textAlign: TextAlign.center,
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
