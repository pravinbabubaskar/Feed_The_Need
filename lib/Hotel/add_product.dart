import 'dart:io';
import 'package:feedthenead/Hotel/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedthenead/helpers/style.dart';
import 'package:feedthenead/widgets/custom_file_button.dart';
import 'package:feedthenead/widgets/custom_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class Add_product extends StatefulWidget {
  final String _id;

  Add_product(this._id);
  @override
  _Add_productState createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  final _key = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _des, _price, _url, _pid;
  File _image;
  final picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;
  String imageUrl;
  CollectionReference users = FirebaseFirestore.instance.collection('hotel');
  String e = "loading...";
  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  }

  Future uploadImage() async {
    setState(() async {
      if (_image != null) {
        //Upload to Firebase

        var snapshot = await _firebaseStorage
            .ref()
            .child('Product_img/${widget._id}/${_pid}')
            .putFile(_image)
            .whenComplete(() {
          setState(() {
            e = "Product Updated successfullyy..";
          });
        });
        showError(e);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
          users
              .doc(widget._id)
              .update({
                "product": FieldValue.arrayUnion([
                  {
                    "name": _name,
                    "price": _price,
                    "description": _des,
                    "p_id": _pid,
                    "p_url": imageUrl,
                  },
                ]),
              })
              .then((value) => print("Image Updated"))
              .catchError((error) => print("Failed to update image: $error"));
          print(imageUrl);
        });
      } else {
        print('No Image Path Received');
      }
    });
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Done',
              style: errorStyle,
            ),
            content: Text(
              errormessage,
              style: messageStyle,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(widget._id)));
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

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
      body: Form(
        key: _formKey,
        child: ListView(
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
                                          pickImage(ImageSource.gallery);

                                          Navigator.pop(context);
                                        }),
                                    new ListTile(
                                        leading: new Icon(Icons.camera_alt),
                                        title: new Text('Take a photo'),
                                        onTap: () async {
                                          pickImage(ImageSource.camera);

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
                                      pickImage(ImageSource.gallery);

                                      Navigator.pop(context);
                                    }),
                                new ListTile(
                                    leading: new Icon(Icons.camera_alt),
                                    title: new Text('Take a photo'),
                                    onTap: () async {
                                      pickImage(ImageSource.camera);

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
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Enter product id';
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Product id",
                          hintStyle: TextStyle(
                              color: black,
                              fontFamily: "raleway",
                              fontSize: 18)),
                      onSaved: (input) => _pid = input),
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
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Enter product Name';
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Product name",
                          hintStyle: TextStyle(
                              color: black,
                              fontFamily: "raleway",
                              fontSize: 18)),
                      onSaved: (input) => _name = input),
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
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Enter product Description';
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Product description",
                          hintStyle: TextStyle(
                              color: black,
                              fontFamily: "raleway",
                              fontSize: 18)),
                      onSaved: (input) => _des = input),
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
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Enter product price';
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Price",
                          hintStyle: TextStyle(
                              color: black,
                              fontFamily: "raleway",
                              fontSize: 18)),
                      onSaved: (input) => _price = input),
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        uploadImage();
                      }
                    },
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
      ),
    );
  }
}
