import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color colorText;
  final Color colorButton;
  final VoidCallback onTap;
  final bool isActive;

  const MyButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.colorText,
    required this.colorButton,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: isActive ? onTap : null,
        child: Container(
          height: 52.h,
          decoration: BoxDecoration(
            color: isActive ? colorButton : null,
            borderRadius: BorderRadius.circular(16).r,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: colorText,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
