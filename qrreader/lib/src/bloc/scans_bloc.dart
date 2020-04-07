import 'dart:async';

import 'package:qrreader/src/bloc/validator.dart';
import 'package:qrreader/src/providers/db_provider.dart';

class ScansBloc with Validators {
  static final ScansBloc _singleton = ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    // Obtener Scans de la Base de Datos
    obtenerScans();
  }

  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream =>
      _scansStreamController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp =>
      _scansStreamController.stream.transform(validarHttp);

  void dispose() {
    _scansStreamController?.close();
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  obtenerScans() async {
    _scansStreamController.sink.add(await DBProvider.db.getTodosScans());
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScans() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
}
