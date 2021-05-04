import 'package:feedthenead/active_orders.dart';
import 'package:feedthenead/past_order.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[100],

            title: Text(
              'Orders',
              style: TextStyle(
                fontFamily: 'Sans'
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
              pastOrder(),
            ],
          )),
    );
  }
}
