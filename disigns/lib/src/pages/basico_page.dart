import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  final estiloSubTitulo = TextStyle(
    fontSize: 16.0,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearFila(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearFila() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lago con un puente',
                    style: estiloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Un lago en Alemania',
                    style: estiloSubTitulo,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '41',
              style: TextStyle(
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _crearAccion('Call', Icons.call),
        _crearAccion('Route', Icons.near_me),
        _crearAccion('Share', Icons.share),
      ],
    );
  }

  Widget _crearAccion(String name, IconData iconName) {
    return Column(
      children: <Widget>[
        Icon(
          iconName,
          color: Colors.blue,
          size: 30.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
        child: Text(
          'Minim voluptate magna velit velit laboris magna nulla ut esse sit. Lorem veniam anim et elit ipsum ea enim cillum minim incididunt enim proident. Dolore tempor elit eu est ad in consectetur. Lorem amet laborum ut labore dolore ea laborum non ullamco pariatur sunt nisi sit.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}