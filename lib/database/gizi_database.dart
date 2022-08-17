import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:temani/models/gizi.dart';

class GiziDatabase {

  static final GiziDatabase instances = GiziDatabase._init();

  static Database? _database;

  GiziDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('gizi.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';

    await db.execute('''
  CREATE TABLE $tableGizi (
    ${GiziModelFields.id} $idType,
    ${GiziModelFields.karbohidrat},
    ${GiziModelFields.protein},
    ${GiziModelFields.lemak}
  )
    ''');
  }

  Future<GiziModelToDB> create(GiziModelToDB giziModelToDB) async {
    final db = await instances.database;

    final id = await db.insert(tableGizi, giziModelToDB.toJson());
    return giziModelToDB.copy();
  }

  Future<GiziModelToDB> read(int id) async {
    final db = await instances.database;

    final maps = await db.query(tableGizi,
        columns: GiziModelFields.values,
        where: '${GiziModelFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return GiziModelToDB.fromJson(maps.first);
    } else {
      throw Exception('Id $id not found');
    }
  }

  Future<List<GiziModelToDB>> readAllData() async {
    final db = await instances.database;

    final result = await db.query(tableGizi);
    return result.map((json) => GiziModelToDB.fromJson(json)).toList();
  }

  Future<int> update(GiziModelToDB giziModelToDB) async {
    final db = await instances.database;

    return db.update(tableGizi, giziModelToDB.toJson(),
        where: '${GiziModelFields.id} = ?', whereArgs: [giziModelToDB.id]);
  }
}
