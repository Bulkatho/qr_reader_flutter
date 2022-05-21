

import 'package:flutter/cupertino.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DatabaseHelper.instance.nuevoScan(nuevoScan);
    //asignar el ID de la BD al modelo.
    nuevoScan.id = id;

    if(this.tipoSeleccionado == nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans () async {
    final scans = await DatabaseHelper.instance.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DatabaseHelper.instance.getScansForType(tipo);
    this.scans = [...?scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DatabaseHelper.instance.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DatabaseHelper.instance.deleteScan(id);
    //cargarScansPorTipo(this.tipoSeleccionado);
  }
}