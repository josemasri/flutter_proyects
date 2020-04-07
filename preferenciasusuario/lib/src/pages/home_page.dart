import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';

import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        backgroundColor: prefs.colorSecundario ? Colors.red : Colors.blue,
        title: Text('Preferencias De Usuario'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
