import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:temani/models/gizi.dart';


class GiziDatabase{
  Database? _database;

  Future<Database> get database async {

    final dbPath = await getDatabasesPath();

    const dbName = 'giziDatabase.db';

    final path = join(dbPath, dbName);

    _database = await openDatabase(path, version: 1, onCreate: _oncreateDB);

    return _database!;

  }

  Future <void> _oncreateDB(Database db, int version) async {
    await db.execute('''

      CREATE TABLE giziDatabase(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        karbohidrat STRING,
        protein STRING,
        lemak STRING
      )
  ''');
  }

  Future <void> _insertGizi(GiziModel giziModel) async {
    final db = await database;

    await db.insert('giziDatabase', giziModel.toMap());
  }

  Future <void> _deleteGizi(GiziModel giziModel) async{
    final db = await database;

    await db.delete('giziDatabase', where: 'id = ?', whereArgs: [giziModel.id] );
  }

  Future <List<GiziModel>> getGizi() async {
    final db = await database;
    List<Map<String,dynamic>> items = await db.query('giziDatabase',orderBy: 'id DESC');

    return List.generate(items.length, (index) => GiziModel(karbohidrat: items[index]['karbohidrat'], protein: items[index]['protein'], lemak: items[index]['lemak']));
  }
}