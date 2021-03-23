import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
class donate extends StatefulWidget {
  @override
  _Donation createState() => _Donation();
}

class _Donation extends State<donate> {
  Future<void> _launched;
  String phone = '';
  String launchURL = 'https://www.paytm.com';

  /*Future<void> _launchbrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch';
    }
  }*/

  Future<void> _launchapp(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
        //   headers: <String , String>{'header_key':'header_value'
        // },
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    } else {
      throw 'Could not launch';
    }
  }

  @override
  void initState() {
    super.initState();
     _launchapp(launchURL);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DONATE"),
           backgroundColor: Colors.blueGrey,
        centerTitle: true,
          ),
      body:Center(

    //backgroundColor: Colors.blueGrey[100]

    child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children:[
                Text(
          'DONATE',
          textAlign:TextAlign.center,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Sans',
            color: Colors.blueGrey,

          ),
          //  textAlign: TextAlign.center
        ),
        Icon(
          Icons.attach_money,
          //size: TextAlign.left,
          color: Colors.blueGrey,
        ),
        // ),
      ],
    ),
    ),


/*
    body:StreamBuilder(
      stream: FirebaseFirestore.instance.collection('NGO').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData)
          return Text('LOADING DATA');
        return Column(
          children:<Widget>[
            Text(snapshot.data.documents[0]['name']),
            Text(snapshot.data.documents[0]['user']),
          ],
        );
      },
    ),
*/
      /*Container(
    child:Column(
    children:<Widget>[
    ElevatedButton (
    child: const Text("PRESS"),
    onPressed:() {
    //_launchbrowser(launchURL);
    },
    ),
    ],
    ) ,
    ),
   /* *///throw UnimplementedError();

    /*
      */
 */
    );
  }
}
