import 'dart:math';
import 'package:flutter/material.dart';
import 'package:upi_pay/upi_pay.dart';

class UpiPayment extends StatefulWidget {
  static const routeName = '/upipayment';
  // string to store the UPI id of the NGO;
  String payid;

  // getting UPI id
  UpiPayment(this.payid);

  @override
  UpiPaymentState createState() => UpiPaymentState();
}

class UpiPaymentState extends State<UpiPayment> {
  // used for storing errors.
  String upiError;

  // used to store the UPI ID and the donation amount
  TextEditingController upicontrol = TextEditingController();
  TextEditingController donationamountControl = TextEditingController();

  // used for showing list of UPI apps installed in current device
  Future<List<ApplicationMeta>> paymentapps;

  @override
  void initState() {
    super.initState();

    // PId data to donate money
    upicontrol.text = "9943914993@api"; //.toString();

    // stores the list of payment apps installed in mobile phone
    paymentapps = UpiPay.getInstalledUpiApplications();
  }

  @override
  void dispose() {
    // dispose the donation amount and pid fields after use.
    upicontrol.dispose();
    donationamountControl.dispose();
    super.dispose();
  }

  //  opens user selected Payment app.
  Future<void> openpaymentapp(ApplicationMeta app) async {
    /*final err = validatePID(upicontrol.text);
    if (err != null) {
      setState(() {
        upiError = err;
      });
      return;
    }

     */
    setState(() {
      upiError = null;
    });

    final transactionRef = Random.secure().nextInt(1 << 32).toString();
    print("Starting transaction with PID $transactionRef");

    // to start payment transaction.
    final paymentdata = await UpiPay.initiateTransaction(
      amount: donationamountControl.text,
      app: app.upiApplication,
      receiverName: 'NGO',
      receiverUpiAddress: upicontrol.text,
      transactionRef: transactionRef,
      merchantCode: '7372',
    );
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
              'Payment',
              style: TextStyle(color: Colors.black, fontFamily: 'Sans'),
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                Text(' "Giving is not just about making a donation it\'s about making a Difference" ',style:TextStyle (
                fontFamily: 'Raleway',
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1
                ),textAlign: TextAlign.center,),
                Text("-Kathy Calvin",style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.grey,
                ),textAlign: TextAlign.right,),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: upicontrol,
                          enabled: false,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter the valid PID',
                            labelText: 'UPI ID',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Sans',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (upiError != null)
                  Container(
                    margin: EdgeInsets.only(top: 4, left: 12),
                    child: Text(
                      upiError,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Theme(
                          data: new ThemeData(
                            primaryColor: Colors.grey,
                            primaryColorDark: Colors.grey,
                          ),
                          child: TextField(
                            controller: donationamountControl,
                            enabled: true,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Sans',
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.black, width: 10)),
                              labelText: 'Donation Amount',
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
                SizedBox(height: 35),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("  Payment Via",
                        style: TextStyle(
                            fontSize: 25, fontFamily: 'Sans', color: Colors.black,fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Apps',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Sans',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      FutureBuilder<List<ApplicationMeta>>(
                        future: paymentapps,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Container();
                          }

                          return GridView.count(
                            crossAxisCount: 1,
                            shrinkWrap: true,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.6,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data
                                .map((i) => Material(
                                      key: ObjectKey(i.upiApplication),
                                      color: Colors.grey[200],
                                      child: InkWell(
                                        onTap: () => openpaymentapp(i),
                                        child: Column(
                                         // mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.memory(
                                              i.icon,
                                              width: 64,
                                              height: 50,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 4),
                                              child: Text(
                                                i.upiApplication.getAppName(),style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Sans'
                                              ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ));
  }
}

String validatePID(String value) {
  if (value.isEmpty) {
    return 'Enter UPI Address.';
  }

  if (!UpiPay.checkIfUpiAddressIsValid(value)) {
    return 'Invalid UPI ID.';
  }

  return "";
}
