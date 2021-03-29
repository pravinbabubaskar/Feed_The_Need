import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:dio/dio.dart';
import 'data.dart';
import 'hotel.dart';

class NearMe extends StatefulWidget {
  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getDistance();

  }

  getDistance() async{
    var dio = Dio();
    final response = await dio.get('https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=11.1760088,76.9958071&destinations=11.1760088,76.9958071&key=AIzaSyChMRxmcfqCAvdTQMPUzi1Lu4hnIrJpAFk');
    print(response.data['rows'][0]['duration']['text']);
  }

  @override
  Widget build(BuildContext context) {
    print(isNGOVerified);
    return Scaffold(
      appBar:AppBar(
        //title: Text("NEAR ME"),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(loc1,style: TextStyle(fontFamily: 'Sans',color: Colors.black),textAlign: TextAlign.left,),
            Text("NGO+",style: TextStyle(fontFamily: 'Sans',color: isNGOVerified==true?Colors.teal[100]:Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
          ],
        ),

      ),
      body:SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10,bottom: 10,left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20,),
              Text("ALL RESTAURANTS", style: TextStyle(
                  fontFamily: 'Sans',
                  fontSize: 17.5,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                    itemCount: hotelData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HotelPage()),
                          );
                        },
                        child: Container(
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: placesWidget(hotelData[index]['name'],hotelData[index]['type']),
                          ),
                        ),
                      );
                    },

                ),
              ),
            ]
          ),
        ),
      )
    );
  }
  Row placesWidget(String img, String name)
  {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/food.png")
              )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Annapoorna", style: TextStyle(
                 fontFamily: 'Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),
              Text("India, Biryani, Ice Cream", style: TextStyle(
                  fontSize: 12,
                fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                color: Colors.grey
              ),),
              SizedBox(
                height: 5,
              ),
              SmoothStarRating(
                size: 20,
                  allowHalfRating: false,
                  starCount: 5,
                  rating: 2,
                  isReadOnly:true,
                  color: Colors.teal,
                  borderColor: Colors.teal[100],
                  spacing:-0.5
              ),
              SizedBox(
                height: 5,
              ),
              Divider(color: Colors.grey),
              Row(
                children: [
                  Text('30 min',style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.w100,
                      color: Colors.grey
                  ),)
                ],
              )

            ],
          ),
        ),
      ],
    );
  }
  void openHotelPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelPage()));
  }
}
