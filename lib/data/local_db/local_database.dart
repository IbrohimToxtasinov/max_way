import 'package:flutter/cupertino.dart';
import 'package:max_way/data/models/cart/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = "Carts";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("carts.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        String intType = "INTEGER";
        String boolType = "INTEGER";

        await db.execute('''
        CREATE TABLE $tableName (
            ${CartFields.id} $idType,
            ${CartFields.productName} $textType,
            ${CartFields.description} $textType,
            ${CartFields.image} $textType,
            ${CartFields.count} $intType,
            ${CartFields.price} $intType
            )
            ''');
      },
    );
    return database;
  }

  static Future<CartModel> insertToDatabase({required CartModel cartModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, cartModel.toJson());
    debugPrint("HAMMASI YAXSHI");
    return cartModel.copyWith(id: id);
  }

  static Future<CartModel> updateProductById({required CartModel updatedContact}) async {
    var database = await getInstance.getDb();
    int id = await database.update(
      tableName,
      updatedContact.toJson(),
      where: 'id = ?',
      whereArgs: [updatedContact.id],
    );
    debugPrint("HAMMASI YAXSHI");
    return updatedContact.copyWith(id: id);
  }

  static Future<List<CartModel>> getAllProductList() async {
    var database = await getInstance.getDb();
    var listOfTodos = await database.query(tableName, columns: [
      CartFields.id,
      CartFields.productName,
      CartFields.price,
      CartFields.count,
      CartFields.image,
      CartFields.description,
    ]);

    var list = listOfTodos.map((e) => CartModel.fromJson(e)).toList();

    return list;
  }

  static Future<int> deleteProductById({required int id}) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }
}