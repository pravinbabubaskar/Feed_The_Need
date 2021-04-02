import 'package:flutter/material.dart';
import 'data.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return cartData.length==0?Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/cart.png'),
          Text('No More Waste',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              letterSpacing: -1,
              color: Colors.black,
              fontSize: 20,
            ),),
          Text("Your cart is empty. Add something from the menu",
            textAlign: TextAlign.center,
            style: TextStyle(
            fontFamily: "Sans",
            letterSpacing: -1,
            color: Colors.grey,
            fontSize: 20,
          ),
          ),
        ],
      )
    ):Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Your Cart", style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                        ),),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 0.5,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartData.length,
                      itemBuilder: (BuildContext context, int index) {
                                  return placesWidget(cartData[index]);
              },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total ($toto items)", style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                        ),),
                        Text("\₹ $cost", style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("+Taxes", style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey
                        ),),
                        Text("\₹ "+(cost*0.1).toString(), style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Discounts", style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey
                        ),),
                        Text(isNGOVerified==true? "- $cost":"- "+ (cost/2).toString() , style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payable", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),),
                        Text("\$102", style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey
                        ),)
                      ],
                    ),
                    SizedBox(height: 25,),
                    Text("Have a Promo Code?", style: TextStyle(
                        color: Colors.green
                    ),),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: openSuccessPage,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.green,
                        ),
                        child: Text("Check Out", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Row placesWidget(Map<dynamic,dynamic>mp)
  {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(mp["p_url"])
              )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${mp['name'][0].toUpperCase()}${mp['name'].substring(1)}',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),

            ],
          ),
        ),
        SizedBox(width: 10,),
        Row(
          children: [
            Text("Quantity ", style: TextStyle(
                fontSize: 14,
                color: Colors.black
            ),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text("1", style: TextStyle(

                  fontSize: 13,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ],
        )
      ],
    );
  }
  void openSuccessPage()
  {
   // Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessPage()));
  }
}
