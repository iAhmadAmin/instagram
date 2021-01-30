import 'package:get/get.dart';
import 'package:instagram/core/models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;
  UserModel get user => _userModel.value;

  @override
  void onInit() {
    // _userModel = Databsae();
    super.onInit();
  }

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
