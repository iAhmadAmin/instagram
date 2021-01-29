import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final _box = GetStorage();
  final _key = 'isLogedIn';

  /// Load isLogedIn from local storage and if it's empty, returns false;
  bool isLogedIn() => _box.read(_key) ?? false;

  /// Save isLogedIn to local storage
  saveIsLogedIn(bool isLogedIn) => _box.write(_key, isLogedIn);
}
