import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedthenead/data.dart';
import 'package:feedthenead/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search by name...'),
            onChanged: (val) {
              setState(() {
                name = "";
                name = val;
                if (name.isNotEmpty)
                  print(
                      name[0].toUpperCase() + name.substring(1).toLowerCase());
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
                .collection('hotel')
                .where('name',
                    isGreaterThanOrEqualTo:
                        name[0].toUpperCase() + name.substring(1).toLowerCase())
                .where('name',
                    isLessThan: name[0].toUpperCase() +
                        name.substring(1).toLowerCase() +
                        'z')
                .snapshots()
            : FirebaseFirestore.instance.collection("hotel").snapshots(),
        builder: (context, snapshot) {
          int len = snapshot.data.docs.length;
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : AnimationLimiter(
                  child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data.docs[index];
                      if (len == 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/table.png'),
                            Text(
                              'No More Waste',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                letterSpacing: -1,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "No Restaurents Available..",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Sans",
                                letterSpacing: -1,
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        );
                      } else
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 2000),
                          child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HotelPage(
                                                  hotelData:
                                                      snapshot.data.docs[index],
                                                )));
                                  },
                                  child: Card(
                                    child: Row(
                                      children: <Widget>[
                                        Image.network(
                                          data['imageUrl'],
                                          width: 150,
                                          height: 100,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['name'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              data['type'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        );
                    },
                  ),
                );
        },
      ),
    );
  }
}
