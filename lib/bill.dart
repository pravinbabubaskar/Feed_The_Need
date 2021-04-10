import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:feedthenead/Past_orders.dart';
import 'package:feedthenead/data.dart';
import 'package:flutter/material.dart';
import 'package:feedthenead/home.dart';

class bill extends StatefulWidget {
  double pay;
  @override
  bill(this.pay);
  billState createState() => new billState();
}

class billState extends State<bill> {
  CountDownController time = CountDownController();
  bool ispause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "YOUR ORDER CONFIRMED",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        //backgroundColor: Colors.white,
        child: CircularCountDownTimer(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          duration: 20,
          fillColor: Colors.blue,
          controller: time,
          backgroundColor: null, //Colors.white,
          strokeWidth: 10.0,
          strokeCap: StrokeCap.round,
          isTimerTextShown: true,
          isReverse: false,
          onComplete: () {
            showAlertDialog(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Past_order()));
            /*Alert(
              context:context,
              title:'done',
              style:AlertStyle(
              isCloseButton:true,
              isButtonVisible:false;
              titleStyle:TextStyle(
                  color:Colors.white,
                  fontSize:30.0,
              ),
              ),
          type:AlertType().success
          ).show();*/
          },
          textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
          ringColor: null,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            time.pause();
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        location: loc1,
                      )));
        },
        //icon:Icon(ispause? Icons.play_arrow:Icons.pause),
        label: Text("Cancel Order"),
      ),
    );
    throw UnimplementedError();
  }
//@override

}

showAlertDialog(BuildContext context) {
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
    title: Text("Time Out"),
    content: Text("Your Order Cancelled."),
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
