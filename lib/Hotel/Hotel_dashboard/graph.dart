import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

class graph extends StatefulWidget{
  final String _id;
  graph(this._id);
  @override
  graphState createState() => graphState();
}
class graphState extends State<graph>
{

  int iftouch;
  List<String> productName =new List();
  List<dynamic> quantity = new List();
  CollectionReference collection = FirebaseFirestore.instance.collection('hotel');

  void getUsersList(String id) async {
    var document =await FirebaseFirestore.instance.collection('hotel').get();
    for(var m in document.docs){
      if(m.id==id) {
        print(m.data()['product']);
        for(var values in m.data()['product']){
          productName.add(values['name']);
          quantity.add(values['quantity'].toDouble());
          //temp.add(values['quantity'].toDouble());
        }

      }
    }
    print(productName);
    print(quantity);
  }
  @override

  void initState() {
    super.initState();
    getUsersList(widget._id);

  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: _buildBarTouchData(),
      titlesData: axesDesign(),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: createbars(),
    );
  }



  List<BarChartGroupData> createbars() {
    return List.generate(
      quantity.length,
          (index) => createBar(index, quantity[index],
          isTouched: index == iftouch),
    );
  }



  BarChartGroupData createBar(
      int xvalue,
      double
       yvalue, {
        bool isTouched = false,
      }) {
    return BarChartGroupData(
      x: xvalue,
      barsSpace:2,
      //borderRadius:3.0,
      barRods: [
        BarChartRodData(

          y: isTouched ? yvalue+10: yvalue,
          colors: isTouched ? [Colors.yellow,Colors.lightGreenAccent,Colors.greenAccent[200],Colors.green[300]] : [Colors.yellow[300]],// : Colors.white,
          width: 30,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            //y: 40,
            colors:[Colors.grey[300]] ,
          ),
        ),
      ],
    );
  }


  FlTitlesData axesDesign() {
    return FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        /*textStyle: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),*/
        margin: 20,
        getTitles: (double value) {
          return productName[value.toInt()];
        },
      ),
     leftTitles: SideTitles(
        showTitles: false,
        /*getTitles: (double value) {
          return value.toString();
        },*/
      ),
    );
  }



  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.grey[200],
          fitInsideHorizontally:true,
          fitInsideVertically:true,
        getTooltipItem: (grp, grpInd, rod, rodIndex) {
          return BarTooltipItem("Item : "+
              productName[grp.x.toInt()] + '\n' + "Quantity : "+quantity[grp.x.toInt()].toString(),//(t).toString(),//(rod.y).toString(),
            TextStyle(color: Colors.black),
          );
        },
      ),
      touchCallback: (barTouchResponse) {
        setState(() {
          if (barTouchResponse.spot != null &&
              barTouchResponse.touchInput is! FlPanEnd &&
              barTouchResponse.touchInput is! FlLongPressEnd
              ) {
            iftouch = barTouchResponse.spot.touchedBarGroupIndex;
          } else {
            iftouch = -1;
          }
        });
      },
    );
  }



  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
          backgroundColor: Colors.white,
          title:Text('FOOD Details',style: TextStyle(
              fontFamily: 'Sans',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),

          ),
          leading: IconButton(
            icon:Icon(Icons.arrow_back,color: Colors.teal),
            onPressed: ()
            {
              Navigator.pop(context, false);
            },
          ),
          centerTitle: true),

      body:
       Container(
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color:Colors.blueGrey,
      ),
      margin: EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16),
      child:Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Unused Food',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Remaining',
            style: TextStyle(
                color:Colors.grey[800],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                mainBarData(),
                swapAnimationDuration: Duration(milliseconds: 400),
                //AnimatedAlign:anim// Optional
                //AnimatedContainer:
                //:Curves.linear,
                //swapAnimationCurve: Curves.linear,
              ),

            ),
          ),
        ],
      ),
      ),
       ),
    );
    //throw UnimplementedError();
  }

}