import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
      ),
      body: Row(
        children: <Widget>[
          Cuadrado(Colors.red),
          Expanded(
            flex: 3,
            child: Cuadrado(Colors.green),
          ),
          Expanded(
            flex: 2,
            child: Cuadrado(Colors.green),
          ),
          Cuadrado(Colors.blue),
        ],
      ),
    );
  }
}

class Cuadrado extends StatelessWidget {
  final Color color;
  Cuadrado(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: this.color),
    );
  }
}
