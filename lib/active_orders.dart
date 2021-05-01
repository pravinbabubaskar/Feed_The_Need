import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedthenead/data.dart';
import 'package:feedthenead/qr_generate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Active extends StatefulWidget {
  const Active({Key key}) : super(key: key);

  @override
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  List<dynamic> qr_temp = List<dynamic>();
  List<dynamic> qr_res = List<dynamic>();

  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    final ds = await _store.collection("QrCode").doc(user1.email).get();
    setState(() {
      qr_temp = ds['data'];
      int l = qrData.length;
      for (int i = l; i < qr_temp.length; i++) {
        qr_res.add(qr_temp[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: qr_res.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GeneratePage(qrData[index]["transaction id"]),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'images/qr.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "order" + " " + index.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "₹ " + qr_res[index]['Cost'].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 90),
                              Text(
                                "Active",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
