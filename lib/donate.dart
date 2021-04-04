
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
      // appBar: AppBar(title: Text("Donate For A Cause",style: TextStyle(
      //     fontFamily: 'Raleway',
      //     fontSize: 25,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.black
      //     ),
      //     ),
      //      backgroundColor: Colors.white,
      //   centerTitle: true,
      //     ),
        bottomNavigationBar: Stack(
          children: [
            Container(
              child: Image.asset('images/donate.png'),
              height: 200.0,
              width: double.infinity,
            ),
          ],
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
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: Image.asset('images/donate1.png'),
                    height: 200.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Registered NGO",
                        style: TextStyle(
                            fontFamily: 'Sans',
                            color: Colors.teal[100],
                            fontSize: 22,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Under Feed the Need",
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 22,
                      letterSpacing: -0.5,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount:snapshot.data.length,
                      itemBuilder: (_,index) {
                       return ListTile(
                        title:Container(
                          child: Text(snapshot.data[index]['name'],style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey
                          ),
                          ),
                        ),

                         onTap:()=>navigateToDetail(snapshot.data[index]),
                        );
                      }
                      ),
                ),
              ],
            ),
          );
        }
      }
      ),
    );
  }
}

