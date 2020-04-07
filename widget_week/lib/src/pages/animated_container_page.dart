import 'package:flutter/material.dart';

import 'dart:math' as math;

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  final random = math.Random();
  Color _color = Colors.red;
  Color _borderColor = Colors.black;

  double _width = 70;
  double _height = 70;
  double _radius = 70;
  double _borderWidth = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.bounceOut,
          duration: Duration(milliseconds: 1000),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_radius),
            border: Border.all(
              width: _borderWidth,
              color: _borderColor,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width = random.nextDouble() * 400;
            _height = random.nextDouble() * 400;
            _radius = random.nextDouble() * 200;
            _borderWidth = random.nextDouble() * 30;
            _borderColor = Color.fromRGBO(
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
              1,
            );
            _color = Color.fromRGBO(
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
              1,
            );
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
