import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screens/bottomnav.dart';
import 'package:getx/constant.dart';
import 'package:getx/screens/signin.dart';
import 'package:getx/models/model.dart' as model;
import 'package:image_picker/image_picker.dart';

class Controler extends GetxController {
  static Controler instance = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _image;
  File? get profilePic => _image.value!;

  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());

    ever(_user, _intialScreen);
  }

  _intialScreen(User? user) {
    if (user == null) {
      Get.offAll(const Signin());
    } else {
      Get.offAll(const Bnb());
    }
  }

  void pickedimage() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      Get.snackbar("profile picture selected", "",
          snackPosition: SnackPosition.BOTTOM);
    }
    _image = Rx<File?>(File(pickedimage!.path));
  }

  Future<String> _uploadtofirebase(File image) async {
    Reference ref =
        firebaseStorage.ref().child('profile').child(auth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void register(
      String username, String email, String password, File? image) async {
    try {
      UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String downloadUrl = await _uploadtofirebase(image!);

      model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profile: downloadUrl);

      await firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(user.toJason());
    } catch (e) {
      Get.snackbar("about user", "please fill your credentials properly",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "account signin fail",
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("about user", "user message",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "account signin fail",
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void loginanom() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      Get.snackbar("about user", "user message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "account signin fail",
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
