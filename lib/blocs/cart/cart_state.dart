part of 'cart_bloc.dart';

abstract class CartState {
  late List<CartModel> products = [];
}

/// Initial Cart
class InitialStateGet extends CartState {}

/// GET Cart
class LoadInProgressGet extends CartState {}

class LoadInSuccessGet implements CartState {
  @override
  List<CartModel> products;

  LoadInSuccessGet({required this.products});
}

class LoadInFailureGet extends CartState {
  String errorText;

  LoadInFailureGet({required this.errorText});
}

/// ADD Cart
class LoadInProgressAdd extends CartState {}

class LoadInSuccessAdd extends CartState {}

class LoadInFailureAdd extends CartState {}

/// UPDATE Cart
class LoadInProgressUpdate extends CartState {}

class LoadInSuccessUpdate extends CartState {}

class LoadInFailureUpdate extends CartState {}

/// DELETE Cart
class LoadInProgressDelete extends CartState {}

class LoadInSuccessDelete extends CartState {}

class LoadInFailureDelete extends CartState {}


/// DELETE All Product in Cart
class LoadInProgressDeleteAll extends CartState {}

class LoadInSuccessDeleteAll extends CartState {}

class LoadInFailureDeleteAll extends CartState {}
