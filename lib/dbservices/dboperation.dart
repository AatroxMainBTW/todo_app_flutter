import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{


  static final _dbname = 'todo.db';
  static final _dbVersion = 1;
  static final _tablename = 'todo';
  static final columnId = "id";
  static final columnName = "name";
  static final columnContent = "content";
  static final columnLabel = "label";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async{
      if(_database!=null) return _database;

      _database = await _initiateDatabase();
      return _database;
  }

  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbname);
    return await openDatabase(path,version: _dbVersion,
    onCreate: _onCreate

    );


  }

  Future _onCreate(Database db, int version) {
     db.execute(
        '''
         CREATE TABLE $_tablename(
         $columnId INTEGER PRIMARY KEY,
         $columnName TEXT NOT NULL,
         $columnContent TEXT NOT NULL,
         $columnLabel TEXT NOT NULL
         )'''
      );
  }

    Future<int> insert(Map<String,dynamic> row) async{
       Database db = await instance.database;
      return await db.insert(_tablename, row);
    }

    Future<List<Map<String,dynamic>>> queryAll() async{
        Database db = await instance.database;
        return await db.query(_tablename);
    }

    Future<int> update(Map<String,dynamic> row) async {
        Database db = await instance.database;
        int id = row[columnId];
        db.update(_tablename,row,where: '$columnId = ? $columnName = ? $columnContent = ? $columnLabel = ?',whereArgs: [id]);
    }

    Future<String> delete(String name) async {
      Database db = await instance.database;
      await db.delete(_tablename,where: '$columnName = ?',whereArgs: [name]);
    }
}