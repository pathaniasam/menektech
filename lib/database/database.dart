import 'package:manek/model/response/home_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final table = 'Home';

  static const columnId = '_id';
  static const productID = 'productID';
  static const price = 'price';
  static const title = 'title';
  static const image = "image";
  static const quantity = "quantity";

// Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'flutter_sqflite_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: createDb,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  //Create Db for App
  void createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table($columnId INTEGER PRIMARY KEY  AUTOINCREMENT,'
        '$title Text,$productID INTEGER,$price INTEGER,$quantity INTEGER,$image Text )');
  }

  Future<List<HomeDatabase>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table
    List<HomeDatabase> noteList = [];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(HomeDatabase.fromMap(noteMapList[i]));
    }
    return noteList;
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(table, orderBy: '$columnId ASC');
    return result;
  }

  //Insert Data in Table
  Future<int?> insert(Map<String, dynamic> row) async {
    Database db = await this.database;
    int id = row[productID];
    var list = await db.rawQuery('SELECT * FROM $table WHERE $productID=$id');
    var listlength = list.length;

    if (listlength < 1) {
      return await db.insert(table, row);
    }
  }

  //Insert Data in Table
  Future<int?> deleteItem(int productIDs) async {
    Database db = await this.database;

    return await db
        .delete(table, where: '$productID = ?', whereArgs: [productIDs]);
  }
}
