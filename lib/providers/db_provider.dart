import 'dart:io' show Directory;


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

class DatabaseHelper {

  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;
  static const table = 'scans';
  static const columnId = 'id';
  static const columnTipo = 'tipo';
  static const columnValor = 'valor';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnTipo TEXT NOT NULL,
        $columnValor INTEGER NOT NULL
      )
      '''
    );
  }
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    Database? db = await instance.database;
    final res = await db!.insert('scans', nuevoScan.toJson());
    //return await db!.insert(table, nuevoScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    Database? db = await instance.database;
    final res = await db!.query('scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
          ? ScanModel.fromJson(res.first)
          : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    Database? db = await instance.database;
    final res = await db!.query('scans');

    return res.isNotEmpty
          ? res.map((scan) => ScanModel.fromJson(scan)).toList()
          : [];
  }

  Future<List<ScanModel>?> getScansForType(String tipo) async {
    Database? db = await instance.database;
    final res = await db!.query('scans', where: 'tipo = ?', whereArgs: [tipo]);

    return res.isNotEmpty
          ? res.map((scan) => ScanModel.fromJson(scan)).toList()
          : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    Database? db = await instance.database;
    final res = await db!.update('scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    Database? db = await instance.database;
    final res = await db!.delete('scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScan() async {
    Database? db = await instance.database;
    final res = await db!.delete('scans');
    return res;
  }
}