import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Row',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Tag('Metal Gear'),
              Tag('God of war'),
              Tag('God of war'),
              Tag('God of war'),
              Tag('God of war'),
              Tag('God of war'),
            ],
          ),
          Text(
            'Wrap',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            spacing: 10,
            children: <Widget>[
              Tag('Metal Gear'),
              Tag('God of war'),
              Tag('God of war'),
              Tag('God of war'),
              Tag('God of war'),
              Tag('God of war'),
            ],
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String texto;

  Tag(this.texto);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        child: Text(texto[0]),
        backgroundColor: Colors.white,
      ),
      label: Text(
        texto,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
