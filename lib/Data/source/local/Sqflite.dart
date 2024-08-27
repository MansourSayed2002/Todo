import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'todo.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {}

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "task" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "taskt" TEXT NOT NULL,
    "note" TEXT NOT NULL DEFAULT 'empty',
    "date" DATE NOT NULL,
    "time" DATETIME NOT NULL,
    "done" TINYINT NOT NULL DEFAULT '0'
  )
 ''');
    print('oncreate======================================');
  }

  readData(String table, String? where) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table, where: where);
    return response;
  }

  insertData(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  updateData(String table, Map<String, Object?> values, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values, where: where);
    return response;
  }

  deleteData(String table, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: where);
    return response;
  }
}
