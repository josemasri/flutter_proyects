import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;
  TextEditingController _textEditingController;
  final PreferenciasUsuario prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;
    prefs.ultimaPagina = SettingsPage.routeName;
    _textEditingController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secunadario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
              ),
              onChanged: (value) {
                setState(() {
                  _nombre = value;
                  prefs.nombreUsuario = value;
                });
              },
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(_textEditingController.text),
          ),
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) {
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }
}
