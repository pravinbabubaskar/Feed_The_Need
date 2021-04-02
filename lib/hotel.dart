import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:like_button/like_button.dart';
import 'cart.dart';
import 'data.dart';

class HotelPage extends StatefulWidget {
  var hotelData;
  HotelPage({Key key, @required this.hotelData}) : super(key: key);
  @override
  _HotelPageState createState() => _HotelPageState(this.hotelData);
}
class _HotelPageState extends State<HotelPage> {
  var data;
  List<dynamic> products = new List();
  _HotelPageState(this.data) {
    products = data['product'];
    print(products);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
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
                            '${data['name'][0].toUpperCase()}${data['name'].substring(1)}',
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
                              size: 25,
                              allowHalfRating: false,
                              starCount: 5,
                              rating: 2,
                              isReadOnly: true,
                              color: Colors.lime,
                              borderColor: Colors.lime[100],
                              spacing: -0.5),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: LikeButton(),
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
                        color: Colors.black54,
                        fontSize: 15),
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
                          fontFamily: 'Sans',
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
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return dishWidget(products[index]);
                }),
          ),

        ],
      ),
    );
  }

  Padding dishWidget(Map<dynamic, dynamic> mp) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${mp['name'][0].toUpperCase()}${mp['name'].substring(1)}',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    mp["description"],
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "₹ " + mp["price"],
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Availability :" + mp["quantity"].toString(),
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 12,
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  children: [
                    Container(height: 140),
                    Container(
                      height: 120,
                      width: 140,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: mp["p_url"] == null
                              ? Image.asset(
                                  "images/food.png",
                                  fit: BoxFit.contain,
                                  height: 80,
                                  width: 100,
                                )
                              : Image.network(
                                  mp["p_url"],
                                  fit: BoxFit.contain,
                                  height: 80,
                                  width: 100,
                                )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                    ),
                    onPressed: () {
                      setState(() {
                        toto++;
                        cost+=int.parse(mp["price"]);
                        openCartPage(mp);
                      });

                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                          fontFamily: 'Sans', fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  void openCartPage(Map<dynamic,dynamic> mp) {
    cartData.add(mp);
    final snackBar = SnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: Colors.green,
      content: Text( '$toto Items | ₹ $cost 😋',style: TextStyle(
        fontFamily: 'Sans',
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),),
      action: SnackBarAction(
        label: 'Cart',
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Cart()),
          );
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}
