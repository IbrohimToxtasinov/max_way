import 'package:bloc/bloc.dart';
import 'package:max_way/data/models/cart/cart_model.dart';
import 'package:max_way/data/repositories/cart_repository.dart';
import 'package:max_way/services/get_it.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialStateGet()) {
    on<UpdateCart>(_updateCart);
    on<DeleteCartProductById>(_deleteCart);
    on<FetchCart>(_fetchAllCart);
    on<AddCart>(_addCart);
    on<DeleteAllProducts>(_deleteAllProductInCart);
  }

  _updateCart(UpdateCart event, Emitter<CartState> emit) async {
    emit(LoadInProgressUpdate());
    await getIt
        .get<CartRepository>()
        .updateProductById(userModel: event.cartModel);
    emit(LoadInSuccessUpdate());
  }

  _fetchAllCart(FetchCart event, Emitter<CartState> emit) async {
    emit(LoadInProgressGet());
    List<CartModel> todos = await getIt.get<CartRepository>().getAllContacts();
    try {
      emit(LoadInSuccessGet(products: todos));
    } catch (e) {
      emit(LoadInFailureGet(errorText: e.toString()));
    }
  }

  _deleteCart(DeleteCartProductById event, Emitter<CartState> emit) async {
    emit(LoadInProgressDelete());
    await getIt.get<CartRepository>().deleteProductById(id: event.id);
    emit(LoadInSuccessDelete());
  }

  _addCart(AddCart event, Emitter<CartState> emit) async {
    emit(LoadInProgressAdd());
    await getIt
        .get<CartRepository>()
        .insertToDatabase(userModel: event.cartModel);
    emit(LoadInSuccessAdd());
  }

  _deleteAllProductInCart(
      DeleteAllProducts event, Emitter<CartState> emit) async {
    emit(LoadInProgressDeleteAll());
    await Future.delayed(const Duration(seconds: 1));
    await getIt.get<CartRepository>().deleteAll();
    emit(LoadInSuccessDeleteAll());
  }
}
