import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/widgets/custom_file_button.dart';
import 'package:feedthenead/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Add_product extends StatefulWidget {
  @override
  _Add_productState createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: white,
          title: Text(
            "Add Product",
            style: TextStyle(color: black),
          )),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: CustomFileUploadButton(
                    icon: Icons.image,
                    text: "Add image",
                    onTap: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              child: new Wrap(
                                children: <Widget>[
                                  new ListTile(
                                      leading: new Icon(Icons.image),
                                      title: new Text('From gallery'),
                                      onTap: () async {
                                        Navigator.pop(context);
                                      }),
                                  new ListTile(
                                      leading: new Icon(Icons.camera_alt),
                                      title: new Text('Take a photo'),
                                      onTap: () async {
                                        Navigator.pop(context);
                                      }),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                )
              ],
            ),
          ),
          Visibility(
            child: FlatButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return Container(
                          child: new Wrap(
                            children: <Widget>[
                              new ListTile(
                                  leading: new Icon(Icons.image),
                                  title: new Text('From gallery'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                  }),
                              new ListTile(
                                  leading: new Icon(Icons.camera_alt),
                                  title: new Text('Take a photo'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        );
                      });
                },
                child: CustomText(
                  text: "Change Image",
                  color: grey,
                  fontfamily: "poppin",
                  size: 16.0,
                )),
          ),
          Divider(),
          Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomText(
                    text: "featured Magazine",
                    color: black,
                    fontfamily: "sans",
                    size: 16.0,
                  )
                ],
              )),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomText(
                text: "Category:",
                color: grey,
                weight: FontWeight.w300,
              ),
              DropdownButton<String>(
                style: TextStyle(color: primary, fontWeight: FontWeight.w300),
                icon: Icon(
                  Icons.filter_list,
                  color: primary,
                ),
                elevation: 0,
                onChanged: (value) {},
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: black, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.5),
                        offset: Offset(2, 7),
                        blurRadius: 7)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Product name",
                      hintStyle: TextStyle(
                          color: black, fontFamily: "raleway", fontSize: 18)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: black, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.5),
                        offset: Offset(2, 7),
                        blurRadius: 7)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Product description",
                      hintStyle: TextStyle(
                          color: black, fontFamily: "raleway", fontSize: 18)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: black, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.5),
                        offset: Offset(2, 7),
                        blurRadius: 7)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Price",
                      hintStyle: TextStyle(
                          color: black, fontFamily: "raleway", fontSize: 18)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
                decoration: BoxDecoration(
                    color: primary,
                    border: Border.all(color: black, width: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: grey.withOpacity(0.3),
                          offset: Offset(2, 7),
                          blurRadius: 4)
                    ]),
                child: FlatButton(
                  onPressed: () async {},
                  child: CustomText(
                    text: "Post",
                    color: white,
                    fontfamily: "poppin",
                    size: 20.0,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
