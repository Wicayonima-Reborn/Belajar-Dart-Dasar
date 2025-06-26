import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, 'todo_app.db');

    print('📂 Database disimpan di: $path');

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
           CREATE TABLE todos (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              isDone INTEGER,
              category TEXT,
              createdAt TEXT
              )
          ''');
        },
      ),
    );
  }
}
