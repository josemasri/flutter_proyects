import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(fontSize: 25);
  final int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Título'), centerTitle: true),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Número de Clicks',
              style: estiloTexto,
            ),
            Text(
              '$count',
              style: estiloTexto,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Hola mundo');
        },
      ),
    );
  }
}
