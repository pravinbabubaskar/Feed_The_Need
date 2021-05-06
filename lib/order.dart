import 'package:feedthenead/active_orders.dart';
import 'package:feedthenead/Past_orders.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String mail=user1.email;//'kannathasan123@gmail.com';
  //user1.email;
  // ignore: deprecated_member_use
  List orders=new List();
  void DBdata() async
  {

      var document = await FirebaseFirestore.instance.collection('orders').get();
      setState(() {
      for (var m in document.docs) {
        if (m.id == mail) {
          orders=m.data()['Transaction'];
        }
      }
      print(orders);

    });

  }
  @override
  void initState()
  {
    //setState(() {
      DBdata();
   // });

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[200],

            title: Text(
              'Orders',
              style: TextStyle(
                fontFamily: 'Sans',
                    fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            bottom: TabBar(
              indicatorColor: Colors.teal[100],
              tabs: [
                Tab(text: 'Active', icon: Icon(Icons.autorenew)),
                Tab(
                  text: 'Completed',
                  icon: Icon(Icons.done_all),
                ),
              ],
            ),
          ),
          body: TabBarView(
            
            children: [
              Active(),
              Past(orders),
              
            ],
          
          )
      ),
    );
  }
}
