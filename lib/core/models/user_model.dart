import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String username;
  String userDp;
  int post;
  int followers;
  int following;
  String name;
  String website;
  String bio;
  String password;
  String email;

  UserModel(
      {this.followers,
      this.email,
      this.following,
      this.bio,
      this.website,
      this.name,
      this.password,
      this.post,
      this.userDp,
      this.username});

  UserModel.fromDocumentSnapshot({@required DocumentSnapshot doc}) {
    this.username = doc['username'];
    this.name = doc['name'];
    this.email = doc['email'];
    this.followers = doc['followers'];
    this.following = doc['following'];
    this.password = doc['password'];
    this.post = doc['post'];
    this.userDp = doc['userdp'];
    this.website = doc['website'];
    this.bio = doc['bio'];
  }
}
