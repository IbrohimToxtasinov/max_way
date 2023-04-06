import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_way/blocs/cart/cart_bloc.dart';
import 'package:max_way/data/models/cart/cart_model.dart';
import 'package:max_way/ui/cart/sub_screens/success_purchase_screen.dart';
import 'package:max_way/ui/home/widgets/product_image.dart';
import 'package:max_way/ui/widgets/global_alert_dialog.dart';
import 'package:max_way/ui/widgets/global_button.dart';
import 'package:max_way/utils/color.dart';
import 'package:max_way/utils/constans.dart';
import 'package:max_way/utils/formatter.dart';

// ignore: must_be_immutable
class CartProducts extends StatelessWidget {
  CartProducts({Key? key, required this.cartProducts}) : super(key: key);

  final List<CartModel> cartProducts;
  num? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w).w,
          height: myHeight(context) * 0.7,
          child: ListView.builder(
            itemCount: cartProducts.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              totalPrice = cartProducts.isNotEmpty
                  ? cartProducts.map((e) => (e.count)).reduce(
                        (value, element) => value + element,
                      )
                  : 0;
              return Column(
                children: [
                  SizedBox(
                    height: 70.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImage(
                          height: 56.h,
                          width: 70.w,
                          image: cartProducts[index].image,
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: myWidth(context) * 0.6.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cartProducts[index].productName,
                                    style: TextStyle(
                                      color: const Color(0xFF222B45),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      MyalertDialog(
                                        context: context,
                                        onTap: () {
                                          BlocProvider.of<CartBloc>(context)
                                              .add(
                                            DeleteCartProductById(
                                              id: cartProducts[index].id!,
                                            ),
                                          );
                                          BlocProvider.of<CartBloc>(context)
                                              .add(
                                            FetchCart(),
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: MyColors.warning900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: 6.h),
                            SizedBox(
                              width: myWidth(context) * 0.6.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${cartProducts[index].count} x ${formatNumber(cartProducts[index].price)}",
                                    style: TextStyle(
                                      color: const Color(0xFFFF3D71),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${formatNumber(cartProducts[index].count * cartProducts[index].price)} so'm",
                                    style: TextStyle(
                                      color: const Color(0xFF222B45),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: const Color(0xFFEDF1F7), thickness: 1.w),
                ],
              );
            },
          ),
        ),
        const Spacer(),
        Center(
          child: Column(
            children: [
              Text(
                "${total(cartProducts)} so'm",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF222B45),
                ),
              ),
              Text(
                "Jami",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF8F9BB3),
                ),
              ),
              BlocListener<CartBloc, CartState>(
                listener: (context, state) {
                  if (state is LoadInProgressDeleteAll) {
                  } else if (state is LoadInSuccessDeleteAll) {
                    Navigator.pop(context);
                    BlocProvider.of<CartBloc>(context).add(FetchCart());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(16.w).w,
                  child: MyButton(
                    title: "Buyurtma berish",
                    onTap: () async {
                      BlocProvider.of<CartBloc>(context)
                          .add(DeleteAllProducts());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PurchaseScreen()));
                    },
                    colorText: const Color(0xFF101426),
                    colorButton: const Color(0xFFFFC34A),
                    isActive: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
