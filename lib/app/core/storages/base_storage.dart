import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const androidOptions = AndroidOptions(encryptedSharedPreferences: true, resetOnError: true);
const iOSOptions = IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device, synchronizable: false);

class BaseStorage {
  final FlutterSecureStorage _storage;
  BaseStorage({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  // -- String
  Future<String?> getString(String key) async {
    return await _storage.read(
      key: key,
      iOptions: iOSOptions,
      aOptions: androidOptions,
    );
  }

  Future<void> setString(String key, String value) async {
    await _storage.write(
      key: key,
      value: value,
      iOptions: iOSOptions,
      aOptions: androidOptions,
    );
  }

  Future<int?> getInt(String key) async {
    String? value = await _storage.read(
      key: key,
      iOptions: iOSOptions,
      aOptions: androidOptions,
    );
    return value != null ? int.tryParse(value) : null;
  }

  Future<void> setInt(String key, int value) async {
    await _storage.write(
      key: key,
      value: value.toString(),
      iOptions: iOSOptions,
      aOptions: androidOptions,
    );
  }

  Future<bool?> getBool(String key) async {
    String? value = await _storage.read(
      key: key,
      iOptions: iOSOptions,
      aOptions: androidOptions,
    );
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  Future<void> setBool(String key, bool value) async {
    await _storage.write(
      key: key,
      value: value.toString(),
      iOptions: iOSOptions,
      aOptions: androidOptions,
    );
  }

  Future<void> remove(String key) async {
    await _storage.delete(
      key: key,
      iOptions: iOSOptions,
      aOptions: androidOptions,
    );
  }
}
