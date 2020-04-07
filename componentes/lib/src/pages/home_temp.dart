import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorto(),
      ),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> lista = new List<Widget>();
  //   for (var opt in _opciones) {
  //     lista..add(ListTile(title: Text(opt)))..add(Divider());
  //   }
  //   return lista;
  // }

  List<Widget> _crearItemsCorto() => _opciones
      .map((t) => Column(
            children: <Widget>[
              ListTile(
                title: Text(t),
                subtitle: Text('Cualquier Cosa'),
                leading: Icon(Icons.access_alarm),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => {},
              ),
              Divider()
            ],
          ))
      .toList();
}
