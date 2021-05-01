import 'package:feedthenead/Hotel/Hotel_dashboard/active_order.dart';
import 'package:feedthenead/Hotel/Hotel_dashboard/completed_order.dart';
import 'package:feedthenead/Past_orders.dart';
import 'package:feedthenead/active_orders.dart';
import 'package:feedthenead/constants.dart';
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
            title: Text(
              'Orders',
              textAlign: TextAlign.center,
            ),
            bottom: TabBar(
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
              ActiveR(),
              Completed(),
            ],
          )),
    );
  }
}
