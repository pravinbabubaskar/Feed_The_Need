//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
final CollectionReference userref=FirebaseFirestore.instance.collection('NGO');
class donate extends StatefulWidget {
  @override
  _Donation createState() => _Donation();
}

class _Donation extends State<donate> {
  Future<void> _launched;
  String phone = '';
  String launchURL = 'https://www.paytm.com';


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

  //@override
  /**void initState() {

    super.initState();
     //_launchapp(launchURL);
    getuser();
  }
  */


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DONATE"),
           backgroundColor: Colors.blueGrey,
        centerTitle: true,
          ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('NGO').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Center(
                  child: Container(
                  width:MediaQuery.of(context).size.width/1.2,
              height:MediaQuery.of(context).size.width/1.2,
              child: Text("TITLE"+document['user'])
              ),
              );
            }
            ).toList()

          );

        }
    )
    //final



    );
  }
}
