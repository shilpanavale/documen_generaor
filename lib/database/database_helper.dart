
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/documen_model.dart';

class DatabaseHelper{
  Database? _database;
  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "document.db"),
        version: 2, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE Document(applicationNo INTEGER PRIMARY KEY autoincrement, outwardNo INTEGER, outwardDate TEXT,applicationName TEXT,ApplicationAddress TEXT,opponents TEXT,hearingDate TEXT,hearingTime TEXT,area INTEGER,cts INTEGER,propertyAddress TEXT,publicDate TEXT,publicNoticeTime TEXT)",
          );
        });
    return _database;
  }
  //the 'future' keyword defines a function that works asynchronously
  Future<int> insertDocument(DocumentModel model) async{
    //local database variable
    final curDB = await openDb();
    //insert function
   return await curDB.insert(
      //first parameter is Table name
      'Document',
      //second parameter is data to be inserted
      model.mapDocument(),
      //replace if two same entries are inserted
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}