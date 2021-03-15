import 'package:feedthenead/Hotel/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data.dart';
import 'welcome.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  signOut() async {
    _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  Hotel_login() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              //margin: EdgeInsets.all(20),
              child: RichText(
                text: TextSpan(
                  text: user1.displayName,
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\n' + user1.email,
                        style: TextStyle(
                            fontFamily: 'Sans',
                            fontSize: 15,
                            color: Colors.grey)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Divider(color: Colors.black),
            GestureDetector(
              //onTap: ,
              child: Container(
                //margin: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('NGO Upgrade',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Divider(thickness: 0.5, color: Colors.grey),
            GestureDetector(
              //onTap: ,
              child: Container(
                //margin: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Past Orders',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Divider(thickness: 0.5, color: Colors.grey),
            GestureDetector(
              onTap: Hotel_login,
              child: Container(
                //margin: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Hotel Login',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
      ),
            Divider(thickness: 0.5, color: Colors.grey),
              GestureDetector(
                //onTap: ,
                child: Container(
                  //margin: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child:Text('Donate For a Cause',style: TextStyle(fontFamily: 'Sans',fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold)),
    ),
              ),
            Divider(thickness: 0.5, color: Colors.grey),
            GestureDetector(
              onTap: signOut,
              child: Container(

                  //margin: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LOGOUT',
                          style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.power_settings_new_sharp,
                        color: Colors.black,
                      )
                    ],
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
