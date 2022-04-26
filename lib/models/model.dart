import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profile;
  String email;
  String uid;

  User(
      {required this.name,
      required this.email,
      required this.profile,
      required this.uid});

  Map<String, dynamic> toJason() =>
      {"name": name, "profile": profile, "email": email, "uid": uid};
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        name: snapshot['name'],
        email: snapshot['email'],
        profile: snapshot['profile'],
        uid: snapshot['uid']);
  }
}
