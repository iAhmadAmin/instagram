import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/core/controllers/main_controller.dart';
import 'package:instagram/core/controllers/user_controller.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:instagram/core/services/database.dart';
import 'package:instagram/core/services/local_storage.dart';
import 'package:instagram/ui/pages/Auth/login_page.dart';
import 'package:instagram/ui/pages/Root/root_page.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final MainController _controller = Get.find<MainController>();
  final UserController _userController = Get.find<UserController>();

  Future<void> signup({@required UserModel userModel}) async {
    try {
      _controller.changeLoading();
      await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      await Database().createNewUser(user: userModel);
      _controller.changeLoading();
      // _userController.user = userModel;
      Get.offAll(LoginPage());
      Get.snackbar("SignUp Successfully!", "Now, you can log in to instagram.");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Registering!", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signin(
      {@required String email, @required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      LocalStorage().writeUserEmail(email);
      LocalStorage().saveIsLogedIn(true);

      Get.offAll(RootPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Logging!", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      LocalStorage().saveIsLogedIn(false);
      Get.offAll(LoginPage());
    } catch (e) {
      Get.snackbar("Error Registering!", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
