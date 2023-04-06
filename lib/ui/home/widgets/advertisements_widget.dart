import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_way/utils/constans.dart';
import 'package:max_way/utils/images.dart';

class AdvertisementsWidget extends StatelessWidget {
  const AdvertisementsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 101.h,
      width: myWidth(context),
      child: CarouselSlider(
        items: List.generate(
          10,
          (index) => Container(
            width: myWidth(context) * 1 - 20.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD278),
              image: const DecorationImage(
                image: AssetImage(AppImages.img),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.circular(12.r).r,
            ),
          ),
        ),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 0,
        ),
      ),
    );
  }
}
