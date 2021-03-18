import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_preferences/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'Settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre = 'Uriel';
  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState()  {
    super.initState();
    // cargarPref();
    prefs.ultimaPagina = SettingsPage.routeName;
    _textController = new TextEditingController( text: prefs.nombreUsuario );
    _genero         = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
  }

  // cargarPref () async {

  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   _genero = prefs.getInt('genero');
  //   setState(() {
      
  //   });
  // }

    //SHAREDPREFERENCES ALMACENA EN DIFERENTE IOS Y ANDROID, APARTE ES RECOMENDADO NO GUARDAR COSAS IMPORTANTES, ES MEJOR USARSE PARA COSAS MÁS SIMPLES COMO CONFIGURACIONES
  _setSelectedRadio( int valor ) {

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.setInt('genero', valor);
    prefs.genero = valor;
    _genero = valor;

    _genero = valor;
    setState(() {
      
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal[800] : Colors.blue[800],
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold, )),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color secundario'),
            onChanged: ( value ){
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),

          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
            // ( value ){
            //   setState(() {
            //   _genero = value;
            //   });
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',
              ),
              onChanged: ( value ){
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      ),
    );
  }
}