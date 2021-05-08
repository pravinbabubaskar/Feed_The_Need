import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Active extends StatefulWidget {
  List orders = new List();
  Active(this.orders);
  @override
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget setupAlertDialoadContainer() {
    return Container(
      height: 210.0, // Change as per your requirement
      width: 210.0, // Change as per your requirement
      child: QrImage(
        data: "1234567890",
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
  String camelCase(String str){
    return "${str[0].toUpperCase()}${str.substring(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: widget.orders.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.orders[index]['Hotel'].toString(),style: TextStyle(
                        fontFamily:'Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      )),
                      Text("₹ "+widget.orders[index]['Cost'].toString(),style: TextStyle(
                          fontFamily:'Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      )),
                    ],
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          child: ListView.builder(
                            itemCount: widget.orders[index]['items'].length,
                              itemBuilder: (context,ind){
                            return Text(camelCase(widget.orders[index]['items'][ind]['name']),style: TextStyle(
                              fontFamily: 'Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.grey
                            ),);
                          }),
                        ),
                      ),
                      IconButton(
                        alignment: Alignment.center,
                        icon:Icon(Icons.qr_code_rounded),
                        onPressed:(){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('QR Code'),
                                  content: setupAlertDialoadContainer(),
                                  actions: [
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              });
                        },)
                    ],
                  ),


                ],
              ),
            );
          }
      ),
    );
  }
}

