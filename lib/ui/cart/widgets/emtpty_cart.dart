import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_way/ui/widgets/global_button.dart';
import 'package:max_way/utils/color.dart';
import 'package:max_way/utils/constans.dart';
import 'package:max_way/utils/images.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: myHeight(context) * 0.2),
          Image.asset(
            AppImages.cartEmpty,
            width: 150.w,
            height: 110.h,
          ),
          SizedBox(height: 24.h),
          const Text(
            "Hali ovqat yo'q",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: MyColors.greyscale400,
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54),
            child: MyButton(
              title: "Oziq-ovqatlarni kashf qilaylik ➜",
              onTap: () {
                Navigator.pop(context);
              },
              colorText: Color(0xFF101426),
              colorButton: Color(0xFFFFC34A),
              isActive: true,
            ),
          ),
        ],
      ),
    );
  }
}
