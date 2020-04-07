import 'package:flutter/material.dart';
import 'package:widget_week/src/models/menu_model.dart';
import 'package:widget_week/src/utils/utils.dart' as utils;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets de la semana'),
      ),
      drawer: _crearDrawer(context),
    );
  }

  Widget _crearDrawer(BuildContext context) {
    return Drawer(
      child: _crearMenu(context),
    );
  }

  Widget _crearMenu(BuildContext context) {
    final menuFuture =
        DefaultAssetBundle.of(context).loadString('assets/menu.json');
    return FutureBuilder(
      future: menuFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return DrawerHeader(
            child: Container(
              color: Colors.blue,
            ),
          );
        } else {
          final menu = menuModelFromJson(snapshot.data);
          return ListView.builder(
            itemCount: menu.length + 1,
            padding: EdgeInsets.zero,
            itemBuilder: (context, i) {
              if (i == 0) {
                return DrawerHeader(
                  child: Text('Lista de Widgets Implementados', style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                );
              }
              return ListTile(
                leading: Icon(utils.iconFromString(menu[i-1].icono)),
                title: Text(menu[i-1].widget),
                onTap: () => Navigator.pushNamed(context, menu[i-1].route),
              );
            },
          );
        }
      },
    );
  }
}
