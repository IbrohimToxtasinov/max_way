part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddCart extends CartEvent {
  CartModel cartModel;

  AddCart({required this.cartModel});
}

class UpdateCart extends CartEvent {
  CartModel cartModel;

  UpdateCart({required this.cartModel});
}

class DeleteCartProductById extends CartEvent {
  int id;

  DeleteCartProductById({required this.id});
}

class FetchCart extends CartEvent {}

class DeleteAllProducts extends CartEvent {}
