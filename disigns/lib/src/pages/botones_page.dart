import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'dart:ui';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ],
        ),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        height: 360.0,
        width: 400.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 9, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100,
          left: -70,
          child: cajaRosa,
        ),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify transaction',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ),
            ),
      ),
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.perm_contact_calendar,
            size: 30.0,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bubble_chart,
            size: 30.0,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.perm_identity,
            size: 30.0,
          ),
          title: Container(),
        ),
      ]),
    );
  }

  Widget _botonesRedondeados() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Table(
        children: [
          TableRow(
            children: [
              _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
              _crearBotonRedondeado(
                  Colors.purpleAccent, Icons.directions_bus, 'Bus'),
            ],
          ),
          TableRow(
            children: [
              _crearBotonRedondeado(Colors.pinkAccent, Icons.shop, 'Buy'),
              _crearBotonRedondeado(
                  Colors.orange, Icons.insert_drive_file, 'File'),
            ],
          ),
          TableRow(
            children: [
              _crearBotonRedondeado(
                  Colors.blueAccent, Icons.movie_filter, 'Entretainment'),
              _crearBotonRedondeado(Colors.green, Icons.cloud, 'Grocery'),
            ],
          ),
          TableRow(
            children: [
              _crearBotonRedondeado(Colors.red, Icons.collections, 'Photos'),
              _crearBotonRedondeado(Colors.teal, Icons.help_outline, 'General'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icon, String texto) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Text(
                texto,
                style: TextStyle(
                  color: color,
                ),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  /* Widget _botonesRedondeados() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _crearTarjeta(
                Colors.blue,
                Colors.blueAccent,
                Icons.style,
                'General',
              ),
              _crearTarjeta(
                Colors.purple,
                Colors.purpleAccent,
                Icons.local_shipping,
                'Transport',
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _crearTarjeta(
                Colors.blue,
                Colors.blueAccent,
                Icons.shopping_basket,
                'Shopping',
              ),
              _crearTarjeta(
                Colors.orange,
                Colors.orangeAccent,
                Icons.note,
                'Bills',
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _crearTarjeta(
                Colors.blue,
                Colors.blueAccent,
                Icons.style,
                'General',
              ),
              _crearTarjeta(
                Colors.purple,
                Colors.blueAccent,
                Icons.local_shipping,
                'General',
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _crearTarjeta(
                Colors.blue,
                Colors.blueAccent,
                Icons.style,
                'General',
              ),
              _crearTarjeta(
                Colors.purple,
                Colors.blueAccent,
                Icons.local_shipping,
                'General',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearTarjeta(Color color, Color color2, IconData icon, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Color.fromRGBO(55, 57, 84, 0.5),
        padding: EdgeInsets.all(20.0),
        height: 150.0,
        width: 150.0,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(70)),
              child: Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color2],
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  } */
}
