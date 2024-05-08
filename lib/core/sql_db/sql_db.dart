import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../features/home/data/models/branch_model.dart';

class SqfliteDb {
  static Database? _database ;

  Future<Database?> get database async{
    if(_database == null){
      _database = await init();
      return _database;
    }
    else{
      return _database;
    }
  }


  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'branches.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,

    );
    return database;
  }

  onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE 'branches' (id INTEGER PRIMARY KEY , branch TEXT , customerNo TEXT , arabicName TEXT , arabicDescription TEXT , englishName TEXT , englishDescription TEXT , note TEXT , address TEXT)");
  }

  Future<List<Map<String,dynamic>>> getData()async{
    Database? myDatabase = await database;
    List<Map<String,dynamic>> response = await myDatabase!.rawQuery("SELECT * FROM 'branches'");
    return response;

  }

  Future<void> insertData({
    required BranchModel branch,
  })async{
    Database? myDatabase = await database;
    await myDatabase!.rawInsert("INSERT INTO 'branches' ('branch', 'customerNo', 'arabicName', 'arabicDescription', 'englishName', 'englishDescription', 'note', 'address') VALUES('${branch.branch}' , '${branch.customerNo}' , '${branch.arabicName}' , '${branch.arabicDescription}' , '${branch.englishName}' , '${branch.englishDescription}' , '${branch.note}' , '${branch.address}')");
  }

  Future<int> deleteData({
    required String id,
  })async{
    Database? myDatabase = await database;
    int bookId = await myDatabase!.rawDelete("DELETE FROM 'branches' WHERE id = ?", [id]);
    return bookId;
  }


   update({
     required BranchModel branch,
    required int id,
  }) async{
     Database? myDatabase = await database;
     return myDatabase!.rawUpdate('UPDATE branches SET branch = ?, customerNo = ?, arabicName = ?, arabicDescription = ?, englishName = ?, englishDescription = ?, note = ?, address = ? WHERE id = ? ',
         [branch.branch, branch.customerNo, branch.arabicName, branch.arabicDescription, branch.englishName, branch.englishDescription, branch.note, branch.address, id]);
  }
}





