import 'dart:math';
import 'package:flutter/material.dart';
import 'package:upi_pay/upi_pay.dart';
import 'bill.dart';
class UpiBill extends StatefulWidget {
  static const routeName = '/upipayment';
  // variable to store the billing amount;
  double pay;

  // getting the billin amount
  UpiBill(this.pay);

  @override
  UpiBillState createState() => UpiBillState();
}

class UpiBillState extends State<UpiBill> {

  // used for storing errors.
  String upiErr;

  // used to store the UPI ID of the hotel and the billing money
  TextEditingController upicontrol = TextEditingController();
  TextEditingController BillamountControl = TextEditingController();

  // used for showing list of UPI apps installed in current device for billing
  Future<List<ApplicationMeta>> paymentapps;

  @override
  void initState() {
    super.initState();

    // getting the billing amount
    BillamountControl.text = (widget.pay.toString());
    //getting the hotel id
    upicontrol.text="abcd@bank";
    // stores the list of apps installed in mobile phone for bill payment
    paymentapps = UpiPay.getInstalledUpiApplications();
  }

  @override

  //  opens user selected Payment app.
  Future<void> openpaymentapp(ApplicationMeta app) async {
    final err = validatePID(upicontrol.text);
    if (err != null) {
      setState(() {
        upiErr = err;
      });
      return;
    }

    setState(() {
      upiErr = null;
    });

    final transactionRef = Random.secure().nextInt(1 << 32).toString();
    print("Billing with id $transactionRef");

    // to start payment transaction.
    final billingdata = await UpiPay.initiateTransaction(
      amount: BillamountControl.text,
      app: app.upiApplication,
      receiverName: 'Restaurant',
      receiverUpiAddress: upicontrol.text,
      transactionRef: transactionRef,
      merchantCode: '7372',
    );
     print(billingdata);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => bill(widget.pay)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.teal[100],
            title: Text('Proceed Payment'),
            //backgroundColor: Colors.blue,
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
                    SizedBox(height: 50),
                    Text("  Payment Details",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Sans',
                            color:Colors.black)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller:upicontrol,
                              enabled: true,//false,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Sans',
                                  color:Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'restaurant PID',
                                labelText: 'UPI ID',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Sans',
                                    color:Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (upiErr != null)
                      Container(
                        margin: EdgeInsets.only(top: 4, left: 12),
                        child: Text(
                          upiErr,
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
                                controller: BillamountControl,
                                // readOnly: true,
                                enabled: true,//false,//true,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Sans',
                                    color:Colors.black
                                ),
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white, width: 10)
                                  ),

                                  labelText: 'Billing Amount',
                                  labelStyle: TextStyle(fontSize: 15,fontFamily: 'Sans',color:Colors.black),
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
                                crossAxisCount: 1,
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
        )
    );
  }
}

String validatePID(String value) {
  if (value.isEmpty) {
    return 'Enter UPI Address.';
  }

  if (!UpiPay.checkIfUpiAddressIsValid(value)) {
    print('             **Invalid UPI ID.**                ');
    return 'Invalid UPI ID.';
  }

  return null;
}
