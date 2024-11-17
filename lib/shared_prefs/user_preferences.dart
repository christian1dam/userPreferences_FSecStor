import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<int> get genero async {
    String? genero = await _storage.read(key: 'genero');
    return genero != null ? int.parse(genero) : 1;
  }

  Future<void> setGenero(int value) async {
    await _storage.write(key: 'genero', value: value.toString());
  }

  Future<bool> get colorSecundario async {
    String? colorSecundario = await _storage.read(key: 'colorSecundario');
    return colorSecundario == 'true';
  }

  Future<void> setColorSecundario(bool value) async {
    await _storage.write(key: 'colorSecundario', value: value.toString());
  }

  Future<String> get nombre async {
    return await _storage.read(key: 'nombre') ?? '';
  }

  Future<void> setNombre(String value) async {
    await _storage.write(key: 'nombre', value: value);
  }

  Future<String?> get lastPage async {
    return await _storage.read(key: 'lastPage');
  }

  Future<void> setLastPage(String value) async {
    await _storage.write(key: 'lastPage', value: value);
  }
}
