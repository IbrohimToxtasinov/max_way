import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_way/ui/widgets/little_global_button.dart';

MyalertDialog({required VoidCallback onTap, required BuildContext context}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Rostdan ham akkountdan chiqishni xohlaysizmi?",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 130.w,
                child: LittleGlobalButton(
                  isActive: true,
                  buttonText: "Yo'q",
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(
                width: 130.w,
                child: LittleGlobalButton(
                  isActive: true,
                  buttonText: "Ha",
                  onTap: () {
                    onTap.call();
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ],
      );
    },
  );
}
