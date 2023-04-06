import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r).r,
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
    );
  }
}
