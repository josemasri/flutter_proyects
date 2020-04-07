import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';

import 'package:formvalidation/src/models/producto_model.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.obtenerProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado(ProductosBloc bloc) {
    return StreamBuilder(
      stream: bloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int i) =>
                _crearItem(context, bloc, productos[i]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc bloc, ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        bloc.eliminarProducto(producto.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            (producto.fotoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(producto.fotoUrl),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
            ListTile(
              title: Text('${producto.titulo} - \$${producto.valor}'),
              subtitle: Text(producto.id),
              onTap: () => Navigator.pushNamed(
                context,
                'producto',
                arguments: producto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
