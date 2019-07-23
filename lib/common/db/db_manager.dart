import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 数据库管理
class DBManager {
  static const _VERSION = 1;
  static const _NAME = "fixdq.db";
  static Database _db;

  /// 初始化
  static init() async {
    /// 获取数据库路径
    var dbPath = await getDatabasesPath();

    /// 数据库文件全路径
    String fullPath = join(dbPath, _NAME);

    /// 创建数据库
    _db = await openDatabase(
      fullPath,
      version: _VERSION,
    );
  }

  /// 判断表是否存在
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _db.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  /// 获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_db == null) {
      await init();
    }
    return _db;
  }

  /// 关闭
  static close() {
    _db?.close();
    _db = null;
  }
}
