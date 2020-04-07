import 'package:flutter/material.dart';

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Area'),
      ),
      body: SafeArea(
        child: ListView(
          children: List.generate(
              200,
              (index) => Text(
                    '$index - Hola mundo',
                    style: TextStyle(fontSize: 20),
                  )),
        ),
      ),
    );
  }
}
