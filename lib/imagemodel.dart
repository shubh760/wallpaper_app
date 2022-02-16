import 'package:cloud_firestore/cloud_firestore.dart';

class WallpaperImage {
  String username;
  String uid;
  String id;
  List likes;
  String imageurl;
  String profilepic;

  WallpaperImage(
      {required this.id,
      required this.imageurl,
      required this.likes,
      required this.profilepic,
      required this.uid,
      required this.username});

  Map<String, dynamic> toJason() => {
        "username": username,
        "uid": uid,
        "id": id,
        "likes": likes,
        "imageurl": imageurl,
        "profilepic": profilepic,
      };

  static WallpaperImage fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return WallpaperImage(
        id: snapshot["id"],
        imageurl: snapshot["imageurl"],
        likes: snapshot["likes"],
        profilepic: snapshot["profilepic"],
        uid: snapshot["uid"],
        username: snapshot["username"]);
  }
}
