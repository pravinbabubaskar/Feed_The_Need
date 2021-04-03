import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:dio/dio.dart';
import 'data.dart';
import 'hotel.dart';
import 'package:web_scraper/web_scraper.dart';

class NearMe extends StatefulWidget {
  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {
  List<dynamic> hotel = new List();
  int i = 0;
  List<String> duration = [
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
   // getRating();
  }

  getData() {
    for (var t in hotelData) {
      if (t['district'] == loc1) {
        hotel.add(t);
        //getDistance(t['latitue'],t['longitude']);
      }
    }
  }

  getRating() async{
    var d;
    final webScraper = WebScraper('https://www.google.com');
    if (await webScraper.loadWebPage(
    '/maps/search/annapoorna+coimbatore/@11.0201763,76.9921138,13z/data=!3m1!4b1')) {
    d= webScraper
        .getElementTitle("div.section-layout.section-scrollbox.scrollable-y.scrollable-show.section-layout-flex-vertical > div.section-layout.section-scrollbox.scrollable-y.scrollable-show.section-layout-flex-vertical > div:nth-child(1) > div > div > div.sJKr7qpXOXd__row > div.section-place-result-container-summary > div > div > div > div:nth-child(3) > div > span.gm2-body-2 > span.rs9iHBFJiiu__container > span.rs9iHBFJiiu__rating");
    }
    print("v dfdf");
    print(d);
  }

  getDistance(double lat, double long) async {
    var dio = Dio();
    double Ulat = latlong.latitude;
    double Ulong = latlong.longitude;
    final response = await dio.get(
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$Ulat,$Ulong&destinations=$lat,$long&key=AIzaSyChMRxmcfqCAvdTQMPUzi1Lu4hnIrJpAFk');
    Map data = response.data;
    setState(() {
      duration[i++] = data['rows'][0]["elements"][0]["duration"]["text"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isNGOVerified);
    return Scaffold(
        appBar: AppBar(
          //title: Text("NEAR ME"),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_city_rounded,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    loc1,
                    style: TextStyle(fontFamily: 'Sans', color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Text(
                "NGO+",
                style: TextStyle(
                    fontFamily: 'Sans',
                    color:
                        isNGOVerified == true ? Colors.teal[100] : Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ALL RESTAURANTS",
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: hotel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HotelPage(hotelData: hotel[index],)),
                            );
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: placesWidget(
                                  hotel[index]['name'],
                                  hotel[index]['type'],
                                  hotel[index]['imageUrl'],
                                  duration[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
          ),
        ));
  }

  Row placesWidget(String name, String abt, String url, String time) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 10),
          height: 120,
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: url == null
                ? Image.asset("images/food.png", fit: BoxFit.contain)
                : Image.network(url, fit: BoxFit.fill),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                abt,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w100,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              SmoothStarRating(
                  size: 20,
                  allowHalfRating: false,
                  starCount: 5,
                  rating: 2,
                  isReadOnly: true,
                  color: Colors.teal,
                  borderColor: Colors.teal[100],
                  spacing: -0.5),
              SizedBox(
                height: 5,
              ),
              Divider(color: Colors.grey),
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.w100,
                        color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
