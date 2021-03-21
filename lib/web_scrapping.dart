import 'dart:io';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data.dart';

class WebScraperApp extends StatefulWidget {
  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://ngodarpan.gov.in');
  final _store = FirebaseFirestore.instance;
  List<String> dummy;
  String result;
  bool flag = false,progress=false;
  String name;
  void findPerson(List<String> people, String Name) async{
    print(people);
    if(people[0][0].codeUnitAt(0)>Name[0].codeUnitAt(0)){
      setState(() {
        flag = true;
        progress=false;
        showResult('Not Found',name);
      });
    }
    final index = people.indexWhere((element) => element == Name);
    if (index >= 0) {
      print('found');
      setState(() {
        result = people[index];
        flag = true;
        progress=false;
        makeVerified();
        //showResult('NGO Verified',name);
      });

    }
  }

  void makeVerified() async{
    bool check = false;
    final snapshots = await _store.collection("NGO").get();
    for (var m in snapshots.docs) {
      var t = m.data();
      if (t['name'] == name) {
        check=true;
        print(check);
        break;
      }
    }
    if(check==true) {
      showResult("Failed", 'Already verified under \n'+ user1.email);
    }
    else{
      FirebaseFirestore.instance.collection('NGO').doc(name)
          .set({'name': name,'user':user1.email}).then((value) => print("User Added"));
      await FirebaseAuth.instance.currentUser.updateProfile(photoURL: 'dvdfv');
      showResult("Success", 'Verified');
      setState(() {
        isNGOVerified = true;
        print(isNGOVerified);
      });


    }
  }
  showResult(String message,String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              message,
              style: errorStyle,
            ),
            content: Text(
              name,
              style: messageStyle,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  void fetchProducts() async {
    int i = 0;
    // Loads web page and downloads into local state of library
    while (i++ < 72 && flag == false) {
      if (await webScraper.loadWebPage(
          '/index.php/home/statewise_ngo/7589/33/$i?per_page=100')) {
        dummy = webScraper
            .getElementTitle("div.ibox-content > table > tbody > tr> td > a ");
      }
      findPerson(dummy, name);
    }
  }



  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("NGO Upgrade",style:headingStyle,),
        ),
        body: isNGOVerified ?Container(
          child: Center(
            child: Text("Already this user is verified under"+user1.email,style: TextStyle(fontFamily: 'Sans',fontSize: 30),),
          ),
        ):Padding(
          padding: const EdgeInsets.all(20.0),
          child: progress==true?
          Center(
            child:
            CircularProgressIndicator(), // Loads Circular Loading Animation
          ):
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'NGO name',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Sans',
                      fontSize: 20.0),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              FlatButton(
                color: Colors.teal[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  setState(() {
                    progress=true;
                    flag=false;
                  });
                  fetchProducts();
                },
                child: Text(
                  ' Get Details',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
