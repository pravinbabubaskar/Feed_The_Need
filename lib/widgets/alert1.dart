import 'package:flutter/material.dart';
import 'package:feedthenead/data.dart';
import 'package:feedthenead/home.dart';
class alert extends StatefulWidget {
  String s;
  @override
  alert(this.s);
  alertstate createState() => alertstate();

}

class alertstate extends State<alert> {
  @override
  void initState()
  {
    showAlertDialog(context,widget.s);
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "YOUR PAYMENT STATUS",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

    );
    throw UnimplementedError();
  }

}

showAlertDialog(BuildContext context,String s) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                location: loc1,
              )));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Status"),
    content: Text(s),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
