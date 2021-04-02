
import 'dart:typed_data';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPage extends StatefulWidget{

  final DocumentSnapshot post;
  DetailPage({this.post});

  @override

  _DetailPageState createState() =>_DetailPageState();

}

class _DetailPageState extends State<DetailPage>{

  @override

  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(
          title:Text(widget.post.get('name'),style: TextStyle(
              fontFamily: 'Sans',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          ),
          centerTitle: true),

      body:
      Container(

        child:
        Card(
          child:ListTile(
            title:Text( widget.post.get('name'),style: TextStyle(
                fontFamily: 'Sans',
                fontSize: 15,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            ),

            subtitle:Text(widget.post.get('user'),style: TextStyle(
                fontFamily: 'Sans',
                fontSize: 15,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            ),

          ),

        ),

      ),


    );
  }
}