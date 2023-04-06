import 'package:flutter/material.dart';
import 'package:max_way/ui/cart/cart_screen.dart';
import 'package:max_way/ui/cart/sub_screens/success_purchase_screen.dart';
import 'package:max_way/ui/home/home_screen.dart';
import 'package:max_way/ui/splash/splash_screen.dart';
import 'package:max_way/utils/constans.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return navigateTo(SplashScreen());
      case homePage:
        return navigateTo(HomeScreen());
      case cartPage:
        return navigateTo(CartScreen());
      case purchasePage:
        return navigateTo(PurchaseScreen());
      default:
        return navigateTo(
          Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) =>
    MaterialPageRoute(builder: (context) => widget);
