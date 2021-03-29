import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Restaurent extends StatefulWidget {
  @override
  _RestaurentState createState() => _RestaurentState();
}

class _RestaurentState extends State<Restaurent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('restaurent'),
      ),
    );
  }
}
