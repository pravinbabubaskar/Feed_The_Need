import 'package:flutter/material.dart';

class Past extends StatelessWidget {
  //const Past({Key key}) : super(key: key);

List orders;
Past(this.orders);
List<String> item=new List();
void cal()
{
  int i=0;
  String t="";
  for(var a in orders)
    {

      for(var b in a['items'])
        {
          t=t+b['name'].toString()+"("+b['quantity'].toString()+") ";
        }
      item.add(t.toString());
      t="";
    }
}
//void initState()
//{
 //super.initState();
//}
Widget Listdata()
{
   cal();
    return ListView.builder(
        itemCount:orders.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title://Row(
                  //children:<Widget>[
                    //Container(
               //       child:
                Column(
                        children:<Widget>[
                           Row( children:<Widget>[
                             Text(" Hotel : "+orders[index]['Hotel'].toString()),]),
                            Row( children:<Widget>[
                              Text(" Bill : "+orders[index]['Cost'].toString()),]),
                          Row( children:<Widget>[
                            Text(" Items : "+item[index]
                              ,)//[index].toString()),
           ]),
                    ]
                      ),
                 //   ),
                  //]
              //),
            ),
          );
    });
}

//Widget card()
//{
 // return
//}

  Widget build(BuildContext context) {
    return Listdata();

  }
}

