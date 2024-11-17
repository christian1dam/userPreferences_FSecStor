import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  Future<void> initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET y SET del Genero
  int get genero {
    // Si no existe el genero, devolverá un 1
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  //GET y SET del ColorSecundario
  bool get colorSecundario {
    // Si no existe el colorSecundario, devolverá un false
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //GET y SET del Nombre de usuario
  String get nombre {
    // Si no existe el nombreUsuario, devolverá una cadena vacía
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  String get lastPage {
    return _prefs.getString('lastPage') ?? '';
  }

  set lastPage(String value){
    _prefs.setString('lastPage', value);
  }
}
