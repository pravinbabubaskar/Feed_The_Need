import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class DBcontent{
  String desc;
  String name;
  String p_id;
  String url;
  String price;
  int quantity;
  charts.Color barcolor=Color.white;
  DBcontent(
  {
    this.desc,
    this.name,
    this.p_id,
    this.url,
    this.price,
    this.quantity
  });
}