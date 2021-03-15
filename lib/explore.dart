import 'package:flutter/material.dart';
class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("EXPLORE",style: TextStyle(
        //fontFamily: "impress",
        color: Colors.blueGrey,
        //fontSize: 15,
      ),),
      ),
    );
  }
}
