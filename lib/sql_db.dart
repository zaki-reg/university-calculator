import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDataBase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDataBase();
      return _db;
    } else {
      return _db;
    }
  }

  initDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'uni_calculator_database.db');
    Database myDataBase = await openDatabase(path, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes" (
    id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
    notes TEXT NOT NULL
    )
    
    ''');
    print("Create DATABASE AND TABLE ========================");
  }
}
