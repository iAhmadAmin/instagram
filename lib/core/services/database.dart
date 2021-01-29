import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram/core/models/user_model.dart';

class Databsae {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createNewUser({@required UserModel user}) async {
    try {
      await _firestore
          .collection("users")
          .add({
            "name": user.name,
            "email": user.email,
            "password": user.password,
            "username": user.username,
            "post": 0,
            "followers": 0,
            "following": 0,
            "website": "",
            "bio": "",
          })
          .then((value) => print("User Added"))
          .catchError((error) => print(" Failed to add user: $error"));
      ;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
