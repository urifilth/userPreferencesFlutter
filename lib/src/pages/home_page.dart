import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_preferences/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'Home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal[800] : Colors.blue[800],
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${ prefs.colorSecundario }'),
          Divider(),
          Text('Género: ${ prefs.genero }'),
          Divider(),
          Text('Nombre de usuario: ${ prefs.nombreUsuario }'),
          Divider(),
        ],
      ),
    );
  }

  // Drawer _crearMenu(BuildContext context) {
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: <Widget>[
  //         DrawerHeader(
  //           child: Container(
  //             ),
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: AssetImage('assets/menu-img.jpg'),
  //                 fit: BoxFit.cover,
  //               )
  //           ),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.pages, color: Colors.blue),
  //           title: Text('Home'),
  //           onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.party_mode, color: Colors.blue),
  //           title: Text('Party mode'),
  //           onTap: (){},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.people, color: Colors.blue),
  //           title: Text('People'),
  //           onTap: (){},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.settings, color: Colors.blue),
  //           title: Text('Ajustes'),
  //           onTap: (){
  //             // Navigator.pop(context);                                             //Mantiene el appbar y sigue manteniendo el menú al inicio
  //             // Navigator.pushNamed(context, SettingsPage.routeName);               //Quita el appBar (menú) y nos coloca una flecha de volver
  //             Navigator.pushReplacementNamed(context, SettingsPage.routeName);       //Reemplaza todo lo que había, sirve para un login porque no nos deja volver a la página anterior

  //           },
  //         ),
  //       ],
  //     ),
  //     // elevation: ,

  //   );
  // }
}