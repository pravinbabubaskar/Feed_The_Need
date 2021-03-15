import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data.dart';
import 'constants.dart';
import 'home.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  Position loc;
  String Userdistrict;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  void initState() {
    super.initState();
    getLocation();
    hideScreen();
    getUser();
  }

  Future getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    loc = position;
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      Userdistrict = first.subAdminArea;

      loc1 = Userdistrict;
    });
  }

  getUser() async {
    User firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
        user1 = user;
      });
    }
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 3600), () {
      FlutterSplashScreen.hide();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(location: Userdistrict)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Loading Data...',
            style: headingStyle,
          ),
        ),
      ),
    );
  }
}
