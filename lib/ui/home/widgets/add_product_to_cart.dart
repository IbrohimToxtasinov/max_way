import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_way/blocs/cart/cart_bloc.dart';
import 'package:max_way/data/models/cart/cart_model.dart';
import 'package:max_way/data/models/product/product_model.dart';
import 'package:max_way/ui/widgets/button_widget.dart';
import 'package:max_way/ui/widgets/global_button.dart';
import 'package:max_way/utils/app_utils.dart';
import 'package:max_way/utils/formatter.dart';

class AddProductToCart extends StatelessWidget {
  const AddProductToCart({
    Key? key,
    required this.minusTap,
    required this.plusTap,
    required this.count,
    required this.productModel,
  }) : super(key: key);

  final VoidCallback minusTap;
  final VoidCallback plusTap;
  final int count;
  final MaxWayProduct productModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: () {
                            minusTap();
                          },
                          title: "-",
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          count.toString(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF222B45),
                          ),
                        ),
                        SizedBox(width: 5.h),
                        ButtonWidget(
                          onTap: () {
                            plusTap();
                          },
                          title: "+",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Order Price",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xFF222B45),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${formatNumber(count * productModel.price)} so'm",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xFFFF3D71),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                MyButton(
                  title: "Savatga qo'shish",
                  onTap: () {
                    List<CartModel> orders =
                        (BlocProvider.of<CartBloc>(context).state.products!);

                    List<CartModel> exists = orders
                        .where((e) => e.productName == productModel.name)
                        .toList();

                    if (exists.isNotEmpty) {
                      for (var element in orders) {
                        if (element.productName == productModel.name) {
                          CartModel cartModel = orders.firstWhere((element) =>
                              element.productName == productModel.name);

                          int currentCount = cartModel.count;

                          BlocProvider.of<CartBloc>(context).add(
                            UpdateCart(
                              cartModel: CartModel(
                                image: productModel.image,
                                price: productModel.price,
                                id: element.id,
                                description: productModel.description,
                                productName: productModel.name,
                                count: count + currentCount,
                              ),
                            ),
                          );
                        }
                      }
                    } else {
                      BlocProvider.of<CartBloc>(context).add(
                        AddCart(
                          cartModel: CartModel(
                            image: productModel.image,
                            price: productModel.price,
                            description: productModel.description,
                            productName: productModel.name,
                            count: count,
                          ),
                        ),
                      );
                    }
                    BlocProvider.of<CartBloc>(context).add(FetchCart());
                    AppUtils.getMyToast(
                        message: "Savatga $count ta mahsulot qo'shildi");
                    Future.delayed(const Duration(milliseconds: 100)).then(
                      (value) => Navigator.pop(context),
                    );
                  },
                  colorText: Colors.white,
                  colorButton: Color(0xFF222B45),
                  isActive: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
