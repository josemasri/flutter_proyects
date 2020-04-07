import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Get y set genero
  int get genero => _prefs.getInt('genero') ?? 1;

  set genero(int value) => _prefs.setInt('genero', value);

  // Get y set color
  bool get colorSecundario => _prefs.getBool('colorSecundario') ?? false;

  set colorSecundario(bool value) => _prefs.setBool('colorSecundario', value);

  // Get y set nombre
  String get nombreUsuario => _prefs.getString('nombreUsuario') ?? '';

  set nombreUsuario(String value) => _prefs.setString('nombreUsuario', value);

  // Get y set ultimaPagina
  String get ultimaPagina =>
      _prefs.getString('ultimaPagina') ?? HomePage.routeName;

  set ultimaPagina(String value) => _prefs.setString('ultimaPagina', value);
}
