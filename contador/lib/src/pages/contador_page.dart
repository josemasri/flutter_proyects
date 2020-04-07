import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statefull'), centerTitle: true),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Número de Clicks',
              style: _estiloTexto,
            ),
            Text(
              '$_count',
              style: _estiloTexto,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      children: [
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: () {
            setState(_reiniciar);
          },
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            setState(_sustraer);
          },
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(_agregar);
          },
        ),
      ],
    );
  }

  void _agregar() {
    setState(() => _count++);
  }

  void _sustraer() {
    setState(() => _count--);
  }

  void _reiniciar() {
    setState(() => _count = 0);
  }
}
