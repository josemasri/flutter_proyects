import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:qrreader/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final MapController mapController = new MapController();
  List<String> mapType = ['streets', 'dark', 'light', 'outdoors', 'satellite'];
  int currentMaptype = 0;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              mapController.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            if (currentMaptype == 4) {
              currentMaptype = 0;
            } else {
              currentMaptype++;
            }
          });
        },
        child: Icon(
          Icons.rotate_right,
        ),
      ),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15,
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan),
      ],
    );
  }

  LayerOptions _crearMapa() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
          '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoiZWxtYXJyb2NvIiwiYSI6ImNrOGVwZGk4NDE3cWkza28xMmk5enA1eG0ifQ.mKCaLwFlM34ZAjcuelm4Ng',
        'id': 'mapbox.${mapType[currentMaptype]}',
        //streets, dark, light, outdoors, satellite
      },
    );
  }

  LayerOptions _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(markers: [
      Marker(
        width: 70.0,
        height: 70.0,
        point: scan.getLatLng(),
        builder: (context) => Container(
          child: Icon(
            Icons.location_on,
            size: 70.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      )
    ]);
  }
}
