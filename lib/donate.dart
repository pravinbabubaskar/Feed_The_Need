import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Donate extends StatefulWidget{
  @override
  _Donation createState() =>_Donation();

}

class _Donation extends State<Donate>{
  Future<void>  _launched;
  String phone='';
  String launchURL='https://www.google.com';
  Future<void> _launchinbrowser(String url) async {

 if(await canLaunch(url))
   {
     await launch(
       url,
       forceSafariVC: false,
       forceWebView: false,
       headers: <String , String>{'header_key':'header_value'
       },
     );
   }
 else{
   throw'Could not launch';
 }
  }
  @override
  Widget
  build(BuildContext context) {
   
  return  Scaffold(
    appBar :AppBar(title : Text ("DONATE")),
    body: Container(
      child:Column(
      children:<Widget>[
        ElevatedButton (
          child: const Text("PRESS"),
            onPressed:() {
              _launchinbrowser(launchURL);
            },
        ),
      ],
      ) ,
    ),
    );
    throw UnimplementedError();
  }
  
}
