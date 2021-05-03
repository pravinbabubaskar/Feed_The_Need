import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'sign_up.dart';
import 'package:flutter/gestures.dart';
import 'login.dart';
class otp extends StatefulWidget {

  @override
  otpState createState() => otpState();

}

class otpState extends State<otp> {
  final TextEditingController Usermail = TextEditingController();
  final TextEditingController otpvalue = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


 /* showAlertOTPsent(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("OTP Sent to"),
      content: Text(Usermail.text),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
*/
  showAlertOTPerror(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => otp()));
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error On Sending OTP"),
      content: Text("try again"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  showAlertverificationFailed(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => otp()));
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Verification Failed!!"),
      content: Text("try again"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  navigateLogIn() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }


  void verify() {
    bool result=EmailAuth.validate(
        receiverMail: Usermail.value.text,
        userOTP: otpvalue.value.text);
    if(result)
      {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(Usermail.toString()),
            ));
      }
    else
      {
        showAlertverificationFailed(context);
      }

  }


  void sendotp() async {
    EmailAuth.sessionName = "FEED THE NEED";
    bool result =
    await EmailAuth.sendOtp(receiverMail: Usermail.value.text);
    if (result) {
      //showAlertOTPsent(context);
      print("<<<<-----SUCCESS----->>>>");
    }
    else{
      showAlertOTPerror(context);
      print("<<<<-----FAILED----->>>>");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'New User',
              style: TextStyle(color: Colors.black, fontFamily: 'Sans'),
            ),
            backgroundColor: Colors.teal[100],
          ),
          body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                    children: <Widget>[

                Container(
                margin: EdgeInsets.only(top: 32),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.black,

                          primaryColorDark: Colors.grey,
                        ),

                        child: TextFormField(
                          controller: Usermail,
                          enabled: true,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter the valid Email ID',
                            labelText: 'Email ID',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Sans',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),

                  ],

                ),

              ),

                      Container(
      margin: EdgeInsets.only(top: 22),
        child: Row(
          children: <Widget>[
          Expanded(
            child: Theme(
              data: new ThemeData(
              primaryColor: Colors.black,
              primaryColorDark: Colors.grey,
              ),
             child: TextField(
              controller: otpvalue,
              enabled: true,
              style: TextStyle(
              fontSize: 15,
              fontFamily: 'Sans',
              color: Colors.black
              ),
              decoration: InputDecoration(
              border: new OutlineInputBorder(
              borderSide: new BorderSide(
              color: Colors.black,
                  width: 10)
              ),
              labelText: 'OTP',
              labelStyle: TextStyle(
              fontSize: 15,
              fontFamily: 'Sans',
              color: Colors.black),
            ),
          ),
        ),
      ),

      ],
    ),
   ),
                      Container(
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Container(
                                margin: EdgeInsets.all(5.0),
                                padding: const EdgeInsets.all(5),
                                child: ElevatedButton(
                                    style:ElevatedButton.styleFrom(
                                        primary: Colors.teal[100],
                                        onPrimary: Colors.black,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(20.0),
                                        ) // foreground
                                    ),
                                    child: Text(
                                      'Send OTP',
                                      style: TextStyle(
                                        fontFamily: 'Sans',
                                        fontSize: 15,

                                      ),
                                    ),

                                    onPressed: () {
                                      sendotp();
                                    }

                                ),

                                height: 70.0,
                                alignment:Alignment.center,

                              ),



                              Container(
                                margin: EdgeInsets.all(5.0),
                                padding: const EdgeInsets.all(5),
                                child: ElevatedButton(
                                  style:ElevatedButton.styleFrom(
                                  primary: Colors.teal[100],
                                  onPrimary: Colors.black,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.0),
                                  ) // foreground
                                ),
                                  child: Text(
                                  ' Proceed ',
                                  style: TextStyle(
                                  fontFamily: 'Sans',
                                  fontSize: 15,
                                ),

                            ),

                            onPressed: () {
                              verify();
                            }

                        ),

                        height: 70.0,
                        alignment:Alignment.center,

                      ),



                    ]
                ),
              ),

                      RichText(

                        text: TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                                color: Colors.black, fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Log-In',
                                style: TextStyle(color: Colors.blue[300]),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  navigateLogIn();
                                },
                              ),
                            ]
                        ),
                      )

                    ]
                ),
    ),
    ),
      ),
    );
  }
}
