import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Ninguna de estas preferencias se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;


  //GET Y SET DEL GÉNERO
  get genero{
    return _prefs.getInt('genero') ?? 1;
  }
  set genero(int value){
    _prefs.setInt('genero', value);
  }

  //GET Y SET DEL COLOR SECUNDARIO
  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }
  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }

  //GET Y SET DEL NOMBRE DE USUARIO
  get nombreUsuario{
    return _prefs.getString('nombreUsuario') ?? '';
  }
  set nombreUsuario(String value){
    _prefs.setString('nombreUsuario', value);
  }

  //GET Y SET DE LA ÚLTIMA PÁGINA
  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? 'home';
  }
  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }

}










