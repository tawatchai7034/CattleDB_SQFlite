import 'package:sqflite/sqflite.dart';
import '../models/catPro.dart';
import '../models/cattles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cattle.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: await (database, version) {
        database.execute(
            'CREATE TABLE catPro(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, gender TEXT,species TEXT)');
        database.execute(
            'CREATE TABLE catTime(id INTEGER PRIMARY KEY AUTOINCREMENT, CPid INTEGER,bodyLenght DOUBLE,heartGirth DOUBLE,hearLenghtSide DOUBLE,hearLenghtRear DOUBLE,hearLenghtTop DOUBLE,PixelReference DOUBLE,DistanceReference DOUBLE,date DATETIME)' +
                'FOREIGN KEY(CPid) REFERENCES catPro(id))');
      },
    );
    return db;
  }

  Future<CattlePro> insertCatPro(CattlePro catPro) async {
    var dbClient = await db;
    await dbClient!.insert('catPro', catPro.toMap());
    return catPro;
  }

  Future<CattleTime> insertCatTime(CattleTime catTime) async {
    var dbClient = await db;
    await dbClient!.insert('catTime', catTime.toMap());
    return catTime;
  }

  Future<List<CattlePro>> getListCattlePro() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('catPro');
    return queryResult.map((e) => CattlePro.fromMap(e)).toList();
  }

  Future<List<CattleTime>> getListCattleTime() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('catTime');
    return queryResult.map((e) => CattleTime.fromMap(e)).toList();
  }

  Future deleteTableContent() async {
    var dbClient = await db;
    return await dbClient!.delete(
      'notes',
    );
  }

  Future<int> deleteCatPro(int id) async {
    var dbClient = await db;
    // int result = await dbClient!.delete(
    //   'catTime',
    //   where: 'CPid = ?',
    //   whereArgs: [id],
    // );
    int result = await dbClient!.delete(
      'catPro',
      where: 'id = ?',
      whereArgs: [id],
    );

    return  result;
  }

   Future<int> updateCatPro(CattlePro catPro) async {
    var dbClient = await db;
    return await dbClient!.update(
      'catPro',
      catPro.toMap(),
      where: 'id = ?',
      whereArgs: [catPro.id],
    );
  }

}
