import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:getx/constant.dart';
import 'package:getx/imagemodel.dart';

class UploadImageContol extends GetxController {
  Future<String> _uploadImagetoStroage(String id, String path) async {
    Reference ref = firebaseStorage.ref().child('images').child(id);
    UploadTask uploadTask = ref.putFile(File(path));
    TaskSnapshot task = await uploadTask;
    String downloadurl = await task.ref.getDownloadURL();
    return downloadurl;
  }

  uploadimage(String imagepath) async {
    try {
      String uid = auth.currentUser!.uid;
      DocumentSnapshot docs =
          await firestore.collection('users').doc(uid).get();
      var alldocs = await firestore.collection('images').get();
      int len = alldocs.docs.length;
      String imageurl = await _uploadImagetoStroage("image $len ", imagepath);

      WallpaperImage wallpaperImage = WallpaperImage(
          id: "image $len",
          imageurl: imageurl,
          likes: [],
          profilepic: (docs.data()! as Map<String, dynamic>)['profile'],
          uid: uid,
          username: (docs.data()! as Map<String, dynamic>)['name']);
      await firestore
          .collection('images')
          .doc('image $len')
          .set(wallpaperImage.toJason());
      Get.back();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }
}
