import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

class graph extends StatefulWidget {
  final String _id;
  graph(this._id);
  @override
  graphState createState() => graphState();
}

class graphState extends State<graph> {
  int iftouch;
  List<String> productName = new List();
  List<dynamic> quantity = new List();
  CollectionReference collection =
      FirebaseFirestore.instance.collection('hotel');

  void getUsersList(String id) async {
    var document = await FirebaseFirestore.instance.collection('hotel').get();
    for (var m in document.docs) {
      if (m.id == id) {
        print(m.data()['product']);
        for (var values in m.data()['product']) {
          setState(() {
            productName.add(values['name']);
            quantity.add(values['quantity'].toDouble());
          });
        }
      }
    }
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
      (index) => createBar(index, quantity[index], isTouched: index == iftouch),
    );
  }

  BarChartGroupData createBar(
    int xvalue,
    double yvalue, {
    bool isTouched = false,
  }) {
    return BarChartGroupData(
      x: xvalue,
      barsSpace: 2,

      barRods: [
        BarChartRodData(
          y: isTouched ? yvalue + 10 : yvalue,
          colors: isTouched
              ? [
                  Color(0xff02d39a),
                  Colors.lightGreenAccent,
                  Colors.greenAccent[200],
                  Colors.green[300]
                ]
              : [Colors.yellow[300]], // : Colors.white,
          width: 30,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            //y: 40,
            colors: [Colors.grey[300]],
          ),
        ),
      ],
    );
  }

  FlTitlesData axesDesign() {
    return FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        margin: 20,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff67727d),
          fontFamily: 'Sans',
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
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
        fitInsideHorizontally: true,
        fitInsideVertically: true,
        getTooltipItem: (grp, grpInd, rod, rodIndex) {
          return BarTooltipItem(
            "Item : " +
                productName[grp.x.toInt()] +
                '\n' +
                "Quantity : " +
                quantity[grp.x.toInt()]
                    .toString(), //(t).toString(),//(rod.y).toString(),
            TextStyle(color: Colors.black,fontFamily: 'Sans',fontSize: 10),
          );
        },
      ),
      touchCallback: (barTouchResponse) {
        setState(() {
          if (barTouchResponse.spot != null &&
              barTouchResponse.touchInput is! FlPanEnd &&
              barTouchResponse.touchInput is! FlLongPressEnd) {
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
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Text(
          'Explore ',
          style: TextStyle(
              fontFamily: 'Sans',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white10,
        ),
        margin: EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Unused Food',
                style: TextStyle(
                  fontFamily: 'Raleway',
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Padding(
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
