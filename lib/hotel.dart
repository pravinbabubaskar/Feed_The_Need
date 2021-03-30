import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:like_button/like_button.dart';


class HotelPage extends StatefulWidget {
  var hotelData;
  HotelPage({Key key, @required this.hotelData}) : super(key: key);
  @override
  _HotelPageState createState() => _HotelPageState(this.hotelData);
}

class _HotelPageState extends State<HotelPage> {
  var data;
  _HotelPageState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: data['imageUrl'] == null
                              ? AssetImage('images/food.png')
                              : NetworkImage(data['imageUrl']),
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(

                                icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                              onPressed: () {
                                  Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    data['name'],
                                    style: TextStyle(
                                        fontFamily: 'Sans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SmoothStarRating(
                                      size: 20,
                                      allowHalfRating: false,
                                      starCount: 5,
                                      rating: 2,
                                      isReadOnly: true,
                                      color: Colors.black,
                                      borderColor: Colors.black,
                                      spacing: -0.5),
                                ],
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.white),
                                child: Center(
                                  child:  LikeButton(),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data['type'],
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Dishes",
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 22,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Expanded(
                        //   child: ListView.builder(
                        //       // scrollDirection: Axis.vertical,
                        //       itemCount: 3,
                        //       // physics: NeverScrollableScrollPhysics(),
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Container(
                        //           child: dishWidget("sushi", "Row Sushi",
                        //               "5 Sushis served in a row"),
                        //         );
                        //       }),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container dishWidget(String img, String name, String description) {
    return Container(
      width: 120,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/$img.png"))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$description",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.black)),
                child: Text("+ Cart"),
              )
            ],
          )
        ],
      ),
    );
  }



  void openCartPage() {
    print("hi");
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
  }
}
