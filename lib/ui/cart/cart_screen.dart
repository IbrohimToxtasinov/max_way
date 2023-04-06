import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_way/blocs/cart/cart_bloc.dart';
import 'package:max_way/ui/cart/widgets/cart_products.dart';
import 'package:max_way/ui/cart/widgets/emtpty_cart.dart';
import 'package:max_way/ui/widgets/custom_appbar.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Savat",
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is LoadInProgressGet) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadInSuccessGet) {
            return state.products.isNotEmpty
                ? CartProducts(cartProducts: state.products)
                : const EmptyCart();
          } else if (state is LoadInFailureGet) {
            return Center(child: Text(state.errorText));
          } else {
            return const Center(child: Text(""));
          }
        },
      ),
    );
  }
}
