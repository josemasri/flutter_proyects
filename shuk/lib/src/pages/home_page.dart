import 'package:flutter/material.dart';
import 'package:shuk/src/widgets/latest_products.dart';
import 'package:shuk/src/widgets/latest_services.dart';

import 'package:shuk/src/widgets/top_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chat),
          onPressed: () {},
        ),
        backgroundColor: Color.fromRGBO(56, 56, 56, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              TopRow(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Nuevos Productos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LatestProducts(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Últimos Servicios',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LatestServices(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'addProduct');
        },
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: Color.fromRGBO(59, 59, 59, 1),
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('Productos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            title: Text('Servicios'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Mi Cuenta'),
          ),
        ],
      ),
    );
  }
}
