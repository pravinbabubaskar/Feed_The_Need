import 'package:flutter/material.dart';
import 'data.dart';


class NearMe extends StatefulWidget {
  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isNGOVerified);
    return Scaffold(
      appBar:AppBar(
        //title: Text("NEAR ME"),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(loc1,style: TextStyle(fontFamily: 'Sans',color: Colors.black),textAlign: TextAlign.left,),
            Text("NGO+",style: TextStyle(fontFamily: 'Sans',color: isNGOVerified==true?Colors.teal[100]:Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),

          ],
        ),

      ),
      body: Center(child: Text("NEAR ME",
        style: TextStyle(
        //fontFamily: "impress",
        color: Colors.blueGrey,
        //fontSize: 15,
      ),
      ),

        //iconTheme: Icons.rice_bowl,
      ),
    );
  }
}
