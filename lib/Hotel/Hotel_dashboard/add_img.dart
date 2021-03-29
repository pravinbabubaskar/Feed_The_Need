import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedthenead/widgets/custom_file_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../constants.dart';

class Add_Img extends StatefulWidget {
  final String _id;
  Add_Img(this._id);
  @override
  _Add_ImgState createState() => _Add_ImgState();
}

class _Add_ImgState extends State<Add_Img> {
  File _image;
  final picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;
  String imageUrl;
  CollectionReference users = FirebaseFirestore.instance.collection('hotel');
  String e = "loading...";
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        if (_image != null) {
          //Upload to Firebase

          var snapshot = await _firebaseStorage
              .ref()
              .child('Restaurent_img/${widget._id}')
              .putFile(_image);

          var downloadUrl = await snapshot.ref.getDownloadURL();

          setState(() {
            imageUrl = downloadUrl;

            users
                .doc(widget._id)
                .update({'imageUrl': imageUrl})
                .then((value) => print("Image Updated"))
                .catchError((error) => print("Failed to update image: $error"));
            print(imageUrl);
            e = "Image uploaded successfullyy..";
            showError(e);
          });
        } else {
          print('No Image Path Received');
        }
      } else {
        print('No image selected.');
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
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Image'),
      ),
      body: Container(
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
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
                                      getImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    }),
                                new ListTile(
                                    leading: new Icon(Icons.camera_alt),
                                    title: new Text('Take a photo'),
                                    onTap: () async {
                                      getImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    }),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
