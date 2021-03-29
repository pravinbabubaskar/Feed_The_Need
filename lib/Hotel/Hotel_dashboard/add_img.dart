import 'package:feedthenead/widgets/custom_file_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Add_Img extends StatefulWidget {
  final String _id;
  Add_Img(this._id);
  @override
  _Add_ImgState createState() => _Add_ImgState();
}

class _Add_ImgState extends State<Add_Img> {
  File _image;
  final picker = ImagePicker();
  String imageUrl;

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        print(imageUrl);
      } else {
        print('No Image Path Received');
      }
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
