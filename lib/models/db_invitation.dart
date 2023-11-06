import 'package:gala_kita/models/invitation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbInvitation {
  static const _databaseName = 'MyDatabase.db';
  static const _databaseV1 = 1;
  static const tableInvitation = 'Invitation';

  //Singleton class
  DbInvitation._privateConstructor();

  static final DbInvitation instance = DbInvitation._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);

    return await openDatabase(path, version: _databaseV1,
        onCreate: (db, version) async {
      var batch = db.batch();
      _onCreateTableInvitation(batch);

      await batch.commit();
    });
  }

  _onCreateTableInvitation(Batch batch) {
    batch.execute('''
    CREATE TABLE $tableInvitation(
    ${Constant.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Constant.title} title TEXT,
    ${Constant.url} TEXT,
    ${Constant.theme_id} INTEGER
    )
    ''');
  }

  Future<int> insertInvitation(InvitationModel model) async {
    Database db = await instance.database;
    return await db.insert(
      tableInvitation,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertInvitations(List<InvitationModel> models) async {
    Database db = await instance.database;

    Batch batch = db.batch();
    for (var model in models) {
      batch.insert(tableInvitation, model.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<InvitationModel>> getInvitations() async {
    Database db = await instance.database;

    // var allData = await db.rawQuery("SELECT * FROM $tableStudent");
    var allData = await db.query(tableInvitation);

    return List.generate(allData.length, (i) {
      return InvitationModel(
          id: int.parse(allData[i][Constant.id].toString()),
          title: allData[i][Constant.title] as String,
          url: allData[i][Constant.url] as String,
          themeId: allData[i][Constant.theme_id] as String);
    });
  }

  Future<InvitationModel?> getInvitationById(int id) async {
    Database db = await instance.database;

    var allData = await db.query(
      tableInvitation,
      where: '${Constant.id}=?',
      whereArgs: [id],
    );

    if(allData.isNotEmpty){
      return InvitationModel(
          id: int.parse(allData[0][Constant.id] as String),
          title: allData[0][Constant.title] as String,
          url: allData[0][Constant.url] as String,
          themeId: allData[0][Constant.theme_id] as String,
      );
    }
      return null;
  }
}
