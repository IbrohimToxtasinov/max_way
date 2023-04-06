import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_way/data/models/product/product_model.dart';
import 'package:max_way/ui/home/widgets/add_product_to_cart.dart';
import 'package:max_way/ui/home/widgets/product_description.dart';
import 'package:max_way/ui/home/widgets/product_image.dart';
import 'package:max_way/utils/constans.dart';
import 'package:max_way/utils/formatter.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  final MaxWayProduct product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: myHeight(context) * 0.7,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h).w,
      child: Column(
        children: [
          ProductImage(
            height: 232.h,
            width: myWidth(context),
            image: widget.product.image,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                "${formatNumber(widget.product.price)} so'm",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          ProductDescription(description: widget.product.description),
          AddProductToCart(
            minusTap: () {
              setState(() {
                if (count != 1) {
                  count--;
                }
              });
            },
            plusTap: () {
              setState(() {
                if (count != 1000) {
                  count++;
                }
              });
            },
            count: count,
            productModel: widget.product,
          )
        ],
      ),
    );
  }
}
