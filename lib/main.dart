import 'package:feedthenead/load_data.dart';
import 'package:feedthenead/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'load_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget next = Welcome();
  void initState() {
    super.initState();
    //this.checkAuthentication();
  }
  //
  // Future checkAuthentication() async {
  //   FirebaseAuth.instance.authStateChanges().listen((firebaseUser) async {
  //     print(firebaseUser);
  //     if (firebaseUser != null) {
  //       next =await Load();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: next,
    );
  }
}
