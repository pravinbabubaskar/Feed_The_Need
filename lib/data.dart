import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

String loc1='Null';
User user1;
bool isNGOVerified = false;
List<dynamic> hotelData ;
Position latlong;
List<String> duration =['Unknown','Unknown'];