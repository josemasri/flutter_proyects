import 'package:flutter/material.dart';
import 'package:shuk/src/bloc/provider.dart';
import 'package:shuk/src/pages/add_edit_product_page.dart';
import 'package:shuk/src/pages/home_page.dart';
import 'package:shuk/src/pages/product_page.dart';

import 'package:shuk/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          backgroundColor: Colors.black87,
        ),
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'addProduct': (context) => AddEditProductPage(),
          'product': (context) => ProductPage(),
        },
      ),
    );
  }
}
