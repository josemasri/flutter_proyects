import 'package:flutter/material.dart';
import 'package:google_example/src/providers/login_provides.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = LoginProvider();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Icon(Icons.person), Text('Login')],
            ),
            onPressed: () {
              loginProvider.facebookLogin();
            },
          ),
        ),
      ),
    );
  }
}
