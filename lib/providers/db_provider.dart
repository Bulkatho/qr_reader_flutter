/*
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';


class DBProvider {
  
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    print(path);
    return openDatabase(
      join(path, 'Scaner.db'),
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE scans(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tipo TEXT,
            valor TEXT,
          );
        ''');
      },
      version: 1,
    );
  }
*/

///***********************************/////
  /* Option mala de insert SQFLITE...
  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db!.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
      VALUES(${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')
    ''');

    return res;
  }*/

  ///***********************************/////

/*
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    try {
      final Database db = await initializeDB();
      final res = await db.insert('scans', nuevoScan.toJson());
      return res;
    } catch (e) {
      return -1;
    }
  }
}

*/