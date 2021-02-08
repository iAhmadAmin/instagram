import 'dart:async';
import 'dart:io';
import 'package:image/image.dart' as Img;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram/core/controllers/edit_profile_controller.dart';
import 'package:instagram/core/controllers/main_controller.dart';
import 'package:instagram/core/models/post.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/pages/Root/root_page.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Reference storageRef = FirebaseStorage.instance.ref('images');
  EditProfileController _controller = Get.put(EditProfileController());
  MainController _mainController = Get.find<MainController>();

  Stream postStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

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
    try {
      await _firestore.collection("users").doc(userModel.email).update({
        'userdp': userModel.userDp,
        'website': userModel.website,
        'name': userModel.name,
        'bio': userModel.bio,
      }).then((value) => print("User Updated"));
    } catch (e) {
      print(e);
    }
  }

  userDataStream({@required String email}) {
    try {
      Stream documentStream =
          FirebaseFirestore.instance.collection('users').doc(email).snapshots();
      return documentStream;
    } catch (e) {
      print("********* ERROR WHILE GETTING USER STREAM ***********");
      print(e);
    }
  }

  Future<String> uploadFile({@required File file}) async {
    try {
      file = await _compressImage(file: file);
      await storageRef.putFile(file);
      final String downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
    }
  }

  _compressImage({@required File file}) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final Img.Image imageFile = Img.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path.jpg')
      ..writeAsBytesSync(Img.encodeJpg(imageFile, quality: 85));
    return compressedImageFile;
  }

  Future<void> createPost({
    @required Post post,
  }) async {
    try {
      _mainController.changeLoading();
      final postId = Uuid().v4();
      final String imgUrl = await uploadFile(file: post.imgFile);
      Timer(const Duration(seconds: 1), () async {
        await _firestore.collection("posts").doc(postId).set({
          'caption': post.caption,
          'location': post.location,
          'imgUrl': imgUrl,
          'comments': post.comments,
          'likes': post.likes,
          'username': post.username,
          'userDpUrl': post.userDpUrl,
        });
        _mainController.changeLoading();
        Get.offAll(RootPage());
      });
    } catch (e) {
      print(e);
    }
  }
}
