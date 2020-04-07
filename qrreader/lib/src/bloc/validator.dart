import 'dart:async';

import 'package:qrreader/src/models/scan_model.dart';

class Validators {
  final validarGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      sink.add(scans.where((s) => s.tipo == 'geo').toList());
    },
  );
  final validarHttp =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      sink.add(scans.where((s) => s.tipo == 'http').toList());
    },
  );
}
