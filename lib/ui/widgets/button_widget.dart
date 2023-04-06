import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r).r,
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFEDF1F7),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20.sp,
                color: Color(0xFF222B45),
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
