import 'package:feedthenead/Hotel/home.dart';
import 'package:feedthenead/Hotel/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _id, _password;

  navigattosign() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_up()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 120,
          ),
          Container(
            margin: EdgeInsets.only(left: 40),
            alignment: Alignment.topLeft,
            child: Text("Welcome !",
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(left: 40),
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                  text: 'Hotel',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: ' Login',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 50,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold))
                  ]),
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
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 20),
                          // ignore: missing_return
                          validator: (input) {
                            if (input.isEmpty) return 'Enter login_id';
                          },
                          decoration: InputDecoration(
                            labelText: 'Login_id',
                            prefixIcon:
                                Icon(Icons.account_circle, color: Colors.teal),
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
                            prefixIcon: Icon(Icons.lock, color: Colors.teal),
                          ),
                          obscureText: true,
                          onSaved: (input) => _password = input),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 175,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          primary: Colors.teal.shade200, // background
                          onPrimary: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ) // foreground
                          ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                      child: Text(
                        'Enter',
                        style: buttonStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RichText(
            text: TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Create One',
                    style: TextStyle(color: Colors.blue[300]),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        navigattosign();
                      },
                  ),
                ]),
          )
        ],
      ),
    ));
  }
}
