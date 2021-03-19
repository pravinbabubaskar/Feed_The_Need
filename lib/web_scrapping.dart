import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';
import 'constants.dart';

class WebScraperApp extends StatefulWidget {
  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://ngodarpan.gov.in');

  // Response of getElement is always List<Map<String, dynamic>>
  List<String> productDescriptions;
  List<String> dummy;
  String result;
  bool flag = false,progress=false;
  String name;

  void findPerson(List<String> people, String Name) {
    print(people);
    if(people[0][0].codeUnitAt(0)>Name[0].codeUnitAt(0)){
      setState(() {
        flag = true;
        progress=false;
        showResult("Not Found",name);
      });
    }
    final index = people.indexWhere((element) => element == Name);
    if (index >= 0) {
      print('found');
      setState(() {
        result = people[index];
        flag = true;
        progress=false;
        showResult("NGO Found",name);
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
    print(productDescriptions);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("NGO Upgrade",style:headingStyle,),
        ),
        body: Padding(
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
