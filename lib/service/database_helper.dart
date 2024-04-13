import 'package:buddy/model/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static int _deVersion = 1;
  static String _dbName = 'buddy.db';

  static Future<Database> _getDb() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
          'create table buddy(id integer primary key, title text not null, description text, end_date text, reminder text)'),
      version: _deVersion,
    );
  }

  static Future<int> insert(TaskModel taskModel) async {
    final db = await _getDb();

    return db.insert(
      'buddy',
      taskModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> update(TaskModel taskModel) async {
    final db = await _getDb();

    return db.update(
      'buddy',
      taskModel.toJson(),
      where: 'id = ?',
      whereArgs: [taskModel.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> delete(TaskModel taskModel) async {
    final db = await _getDb();

    return db.delete(
      'buddy',
      where: 'id = ?',
      whereArgs: [taskModel.id],
    );
  }

  static Future<List<TaskModel>?> getAll() async {
    final db = await _getDb();

    final List<Map<String, dynamic>> maps = await db.query('buddy');
    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
      maps.length,
      (index) => TaskModel.fromJson(
        maps[index],
      ),
    );
  }
}
