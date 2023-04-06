import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:max_way/utils/constans.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goNext();
  }

  void goNext() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        bool firstTime = true;
        if (firstTime) {
          Navigator.pushReplacementNamed(context, homePage);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: myWidth(context)*0.4,
              height: myHeight(context)*0.4,
              child: SvgPicture.asset("assets/svg/max_way_logo.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
