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
    upicontrol.text = (widget.payid);//.toString();

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
    final err = validatePID(upicontrol.text);
    if (err != null) {
      setState(() {
        upiError = err;
      });
      return;
    }
    setState(() {
      upiError = null;
    });

    final transactionRef = Random.secure().nextInt(1 << 32).toString();
    print("Starting transaction with PID $transactionRef");

    // to start payment transaction.
    final paymentdata = await UpiPay.initiateTransaction(
      amount: donationamountControl.text,
      app: app.upiApplication,
      receiverName: 'Pravinbabu',
      receiverUpiAddress: upicontrol.text,
      transactionRef: transactionRef,
      merchantCode: '7372',
    );

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.cyanAccent[400],
                  Colors.blue[600]
                ],
              )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: Text('Proceed Payment'),
              leading: IconButton(
                icon:Icon(Icons.arrow_back),
                onPressed: ()
                {
                  Navigator.pop(context, false);
                  },
              ),
            ),

            body: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 40),
                      Text("  Payment Details",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Sans',
                              color:Colors.white)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                controller:upicontrol,
                                enabled: false,//true,
                                style: TextStyle(fontSize: 15,fontFamily: 'OpenSans',color:Colors.white),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter the valid PID',
                                  labelText: 'UPI ID',
                                  labelStyle: TextStyle(fontSize: 15,fontFamily: 'Sans',color:Colors.white),
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
                                      color:Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.white, width: 10)
                                    ),

                                    labelText: 'Donation Amount',
                                    labelStyle: TextStyle(fontSize: 15,fontFamily: 'OpenSans',color:Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 35),
                      Text("  Payment via",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Sans',
                              color:Colors.white
                          )
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Text('Apps',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Sans',
                                    color:Colors.white
                                ),
                              ),
                            ),

                            FutureBuilder<List<ApplicationMeta>>(
                              future: paymentapps,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState != ConnectionState.done) {
                                  return Container();
                                }

                                return GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.6,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: snapshot.data.map((i) => Material(
                                    key: ObjectKey(i.upiApplication),
                                    color: Colors.grey[200],
                                    child: InkWell(
                                      onTap: () => openpaymentapp(i),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.memory(
                                            i.icon,
                                            width: 64,
                                            height: 50,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 4),
                                            child: Text(
                                              i.upiApplication.getAppName(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  ).toList(),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        )
    );
  }
}
