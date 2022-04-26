import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx/constant.dart';
import 'package:getx/models/imagemodel.dart';

class Imagecontroll extends GetxController {
  final Rx<List<WallpaperImage>> _wallpaperList = Rx<List<WallpaperImage>>([]);
  List<WallpaperImage> get wallpaperList => _wallpaperList.value;

  @override
  void onInit() {
    super.onInit();

    _wallpaperList.bindStream(
        firestore.collection('images').snapshots().map((QuerySnapshot query) {
      List<WallpaperImage> retval = [];
      for (var element in query.docs) {
        retval.add(WallpaperImage.fromSnap(element));
      }
      return retval;
    }));
  }

  likeimages(String id) async {
    DocumentSnapshot docs = await firestore.collection('images').doc(id).get();
    var uid = authController.user.uid;
    if ((docs.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('images').doc(id).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      await firestore.collection('images').doc(id).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
  }
}
