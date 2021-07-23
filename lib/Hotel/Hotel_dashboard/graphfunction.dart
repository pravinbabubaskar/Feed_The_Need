import 'graphdata.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class graphfunction{
  List<DBcontent> ItemList;

  graphfunction(List<DBcontent> ItemList) : this.ItemList = ItemList;
  Widget build(BuildContext context) {
    List<charts.Series<DBcontent, String>> series = [
      charts.Series(
        id: "ItemList",
        data: ItemList,
        domainFn: (DBcontent series, _) => series.name,
        measureFn: (DBcontent series, _) => series.quantity,
        colorFn: (DBcontent series, _) => charts.Color.white,
      )
    ];
    return charts.BarChart(series, animate: true);
  }
}