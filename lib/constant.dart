import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:getx/controlers/controler.dart';
import 'package:getx/screens/home.dart';
import 'package:getx/screens/upload.dart';

List pages = [
  const Home(),
  const Upload(),
  const Text("profile"),
  
];

var auth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = Controler.instance;
