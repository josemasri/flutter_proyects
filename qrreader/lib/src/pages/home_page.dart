import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qrreader/src/bloc/scans_bloc.dart';
import 'package:qrreader/src/models/scan_model.dart';

import 'package:qrreader/src/pages/direcciones_page.dart';
import 'package:qrreader/src/pages/mapas_page.dart';
import 'package:qrreader/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = ScansBloc();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _showDialog,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _crearFloatingActionButton(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones'),
        ),
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
        break;
      case 1:
        return DireccionesPage();
        break;
      default:
        return MapasPage();
        break;
    }
  }

  Widget _crearFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.filter_center_focus),
      onPressed: _scanQR,
    );
  }

  Future<void> _scanQR() async {
    String barcode;
    try {
      barcode = await BarcodeScanner.scan();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        Fluttertoast.showToast(
            msg: "Please accept camera permissions",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Error occured, please try again",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.black54,
            fontSize: 16.0);
      }
    } on FormatException {} catch (e) {}

    if (barcode != null) {
      final scan = ScanModel(valor: barcode);
      await scansBloc.agregarScan(scan);

      if (Platform.isIOS) {
        await Future.delayed(Duration(milliseconds: 750));
      }

      utils.abrirScan(context, scan);
    }
  }

// user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          title:
              new Text("Eliminar todos", style: TextStyle(color: Colors.white)),
          content: new Text(
              "¿Estas seguro que quieres eliminar todos los registros?",
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child:
                  new Text("Cancelar", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child:
                  Text("Eliminar Todos", style: TextStyle(color: Colors.red)),
              onPressed: () async {
                await scansBloc.borrarScans();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
