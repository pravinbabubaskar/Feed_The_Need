import 'package:feedthenead/Hotel/home.dart';
import 'package:feedthenead/Hotel/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

import '../constants.dart';

class Sign_up extends StatefulWidget {
  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  String _name, _id, _password, _place = "current location";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  navigateLogIn() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  void initState() {
    super.initState();
    getLocation();
  }

  Future getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      _place = first.subAdminArea;
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('hotel');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .doc(_id)
          .set({
            'name': _name,
            'id': _id,
            'password': _password,
            'location': _place
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              alignment: Alignment.topLeft,
              child: Text("create",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //fontWeight: FontWeight.bold
            )),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  text: 'New ID',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40,
                      color: Colors.black,
                  //    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.grey,
                        ),
                        child: TextFormField(
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                //fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 20),
                            // ignore: missing_return
                            validator: (input) {
                              if (input.isEmpty) return 'Enter Name';
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.email, color: Colors.cyan),
                            ),
                            onSaved: (input) => _name = input),
                      ),
                    ),
                    Container(
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.grey,
                        ),
                        child: TextFormField(
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 20),
                            // ignore: missing_return
                            validator: (input) {
                              if (input.isEmpty) return 'Enter new_id';
                            },
                            decoration: InputDecoration(
                              labelText: 'New_id',
                              prefixIcon: Icon(Icons.account_circle,
                                  color: Colors.cyan),
                            ),
                            onSaved: (input) => _id = input),
                      ),
                    ),
                    Container(
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.grey,
                        ),
                        child: TextFormField(
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 20),
                            // ignore: missing_return
                            validator: (input) {
                              if (input.length < 6)
                                return 'Provide Minimum 6 Character';
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock,

                                  color: Colors.cyan
                              ),
                            ),
                            obscureText: true,
                            onSaved: (input) => _password = input),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text("Get Current location:   "),
                        Text(_place),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 175,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            primary: Colors.cyan.shade200, // background
                            onPrimary: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ) // foreground
                            ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            addUser();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }
                        },
                        child: Text(
                          'Create',
                          style: buttonStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Log-in',
                              style: TextStyle(color: Colors.cyan[300]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  navigateLogIn();
                                },
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
