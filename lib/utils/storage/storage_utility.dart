import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  late final GetStorage _storage;
  static TLocalStorage? _instance;

  TLocalStorage._internal();
  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }
}
