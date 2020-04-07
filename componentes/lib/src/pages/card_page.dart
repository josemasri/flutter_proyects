import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cards')),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'Vivamus ac pellentesque ipsum. Aliquam aliquam massa sed egestas venenatis. Vestibulum id aliquet libero, at pharetra tortor. Maecenas viverra laoreet odio, ac sodales sem ornare at. Vestibulum ut quam.'),
          ),
          Row(
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://wallpaperaccess.com/full/94472.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text('No tengo idea de que poner'),
            padding: EdgeInsets.all(10),
          )
        ],
      ),
    );
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ));
  }
}
