import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
@singleton
class SqlManager {
  Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialDB();
      return _database;
    } else {
      return _database;
    }
  }

 static Future<Database> initialDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "Movie.db");
    Database movieDb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        Create Table "Movie" (
        "id" INTEGER PRIMARY KEY,
        "title" TEXT,
        "image" TEXT,
        "date" TEXT
        )
        ''');
      },
    );

    return movieDb;
  }

  Future<List<Map<String, Object?>>> getData() async {
    Database? myDb = await database;
    List<Map<String, Object?>> response = await myDb!.rawQuery(
      "SELECT * FROM Movie ",
    );
    return response;
  }

  Future<int> addData(String sql) async {
    Database? myDb = await database;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  Future<int> removeData(String sql) async {
    Database? myDb = await database;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
