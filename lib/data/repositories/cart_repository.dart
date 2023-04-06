import 'package:max_way/data/local_db/local_database.dart';
import 'package:max_way/data/models/cart/cart_model.dart';

class CartRepository {
  Future<int> deleteAll() => LocalDatabase.deleteAll();
  Future<int> deleteProductById({required int id}) => LocalDatabase.deleteProductById(id: id);

  Future<CartModel> insertToDatabase({required CartModel userModel}) =>
      LocalDatabase.insertToDatabase(cartModel: userModel);

  Future<List<CartModel>> getAllContacts() => LocalDatabase.getAllProductList();

  Future<CartModel> updateProductById({required CartModel userModel}) =>
      LocalDatabase.updateProductById(updatedContact: userModel);
}