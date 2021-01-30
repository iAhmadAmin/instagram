import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram/core/models/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createNewUser({@required UserModel user}) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.email)
          .set({
            "name": user.name,
            "email": user.email,
            "password": user.password,
            "username": user.username,
            "post": 0,
            "followers": 0,
            "following": 0,
            "website": "",
            "bio": "",
            "userdp": "",
          })
          .then((value) => print("User Added"))
          .catchError((error) => print(" Failed to add user: $error"));
      ;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUserData({@required String email}) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(email).get();
      return UserModel.fromDocumentSnapshot(doc: _doc);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateUserData({@required UserModel userModel}) async {
    await _firestore
        .collection("users")
        .doc(userModel.email)
        .update({
          'username': userModel.username,
          'website': userModel.website,
          'name': userModel.name,
          'bio': userModel.bio,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
