import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:max_way/utils/constans.dart';
import 'package:max_way/utils/images.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushNamedAndRemoveUntil(
          context, homePage, (route) => false),
    );
    return Scaffold(
      body: Center(child: Lottie.asset(AppImages.successLottie)),
    );
  }
}
