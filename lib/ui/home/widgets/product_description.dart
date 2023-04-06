import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key, required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: 6.h).w,
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF8F9BB3),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
