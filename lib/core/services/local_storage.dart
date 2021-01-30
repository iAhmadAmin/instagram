import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final _box = GetStorage();
  final _key = 'isLogedIn';
  final _userEmail = 'userEmail';

  String getUserEmail() => _box.read(_userEmail);
  void writeUserEmail(String email) => _box.write(_userEmail, email);

  /// Load isLogedIn from local storage and if it's empty, returns false;
  bool isLogedIn() => _box.read(_key) ?? false;

  /// Save isLogedIn to local storage
  saveIsLogedIn(bool isLogedIn) => _box.write(_key, isLogedIn);
}
