
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DatabaseHandler {
  Future<Database> initializeDB() async {
    //String path = await getApplicationDocumentsDirectory();
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final ruta = join(documentsDirectory.path, 'scan.db');
    return await openDatabase(
      ruta,
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }


  Future<int> nuevoScan(ScanModel scan) async {
    int result = 0;
    final Database db = await initializeDB();
    print(db.path);
    result = await db.insert('scans', scan.toJson());
    return result;
  }

}