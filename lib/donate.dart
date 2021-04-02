
import 'dart:typed_data';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'DetailPage.dart';

//final CollectionReference userref=FirebaseFirestore.instance.collection('NGO');
/*Future<void> _launched;
  String launchURL ='upi://pay?pa=pravinbabu171@okhdfc&pn=Hussain%20Imthiaz%20Hussain&aid=uGICAgIDNz7WSBw';
  Future<void> _launchapp(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    } else {
      throw 'Could not launch';
    }
  }
  //@override
  void initState() {
    super.initState();
     _launchapp(launchURL);
  }
*/

class donate extends StatefulWidget {

  @override
  _Donation createState() => _Donation();

}

class _Donation extends State<donate> {

  void initState() {
    super.initState();
  }



  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("DONATE",style: TextStyle(
          fontFamily: 'Sans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black
          ),
          ),
           backgroundColor: Colors.white,
        centerTitle: true,
          ),
        body : ListPage(),
    );
  }

}

class ListPage extends StatefulWidget{

  @override
  _ListPageState createState() =>_ListPageState();

}

class _ListPageState extends State<ListPage>{

  Future getPosts() async{

    var firestore= FirebaseFirestore.instance;
    QuerySnapshot qn= await firestore. collection("NGO").get();
    return qn.docs;

  }

  navigateToDetail(DocumentSnapshot post){

    Navigator.push(context,
        MaterialPageRoute(
            builder:(context)=>DetailPage(post:post,)
        )
    );
  }

  @override
  Widget build(BuildContext context){

    return Container(
      child: FutureBuilder(

          future: getPosts(),
          builder: (_,snapshot){

            if(snapshot.connectionState==ConnectionState.waiting){
          return Center(

            child: Text("Loading"),
          );
        }
        else {
          return ListView.builder(
              itemCount:snapshot.data.length,
              itemBuilder: (_,index) {
               return ListTile(
                title:Text(snapshot.data[index]['name'],style: TextStyle(
                    fontFamily: 'Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey
                ),
                ),

                 onTap:()=>navigateToDetail(snapshot.data[index]),
                );
              }
              );
        }
      }
      ),
    );
  }
}

