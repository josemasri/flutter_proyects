import 'package:flutter/material.dart';

class OpacityPage extends StatefulWidget {
  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  double opacidad = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity - Animated Opacity'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Rectangulo(Colors.red, opacidad),
            Rectangulo(Colors.blue, opacidad),
            Rectangulo(Colors.green, opacidad),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidad = (opacidad == 1) ? 0 : 1;
          });
        },
        child: Icon(Icons.opacity),
      ),
    );
  }
}

class Rectangulo extends StatelessWidget {
  final Color _color;
  final double _opacity;

  Rectangulo(this._color, this._opacity);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.easeOut,
      duration: Duration(seconds: 1),
      opacity: _opacity,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _color,
        ),
      ),
    );
  }
}
