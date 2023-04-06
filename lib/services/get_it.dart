import 'package:get_it/get_it.dart';
import 'package:max_way/data/repositories/cart_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => CartRepository());

}