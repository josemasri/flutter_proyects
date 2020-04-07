import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: <Widget>[
        _crearLista(),
        _crearLoading(),
      ]),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int i) {
            final imagen = _listaNumeros[i];
            return FadeInImage(
              placeholder: AssetImage('assets/original.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?images=$imagen'),
              fit: BoxFit.cover,
              height: 300,
              width: 500,
            );
          }),
      onRefresh: _obtenerPagina1,
    );
  }

  Future _obtenerPagina1() async {
    Timer(Duration(seconds: 2), () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(Duration(seconds: 2));
  }

  _agregar10() {
    _ultimoItem++;
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    return new Timer(Duration(seconds: 2), respuestaHttp);
  }

  respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 150,
        duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  Widget _crearLoading() {
    if (this._isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircularProgressIndicator(),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }
    return Container();
  }
}
