import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'consultacep.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_endereco);
  }

  String get _endereco => '''
    CREATE TABLE endereco (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      logradouro TEXT,
      localidade TEXT,
      cep TEXT,
      uf TEXT
    );
  ''';
}
