import 'package:intl/intl.dart';

import '../data/models/cart/cart_model.dart';

String formatNumber(num number) {
  final formatter = NumberFormat('#,##0');
  final formatted = formatter.format(number);
  return formatted;
}

String total(List<CartModel> products) {
  num sum = 0;
  for (int i = 0; i < products.length; i++) {
    sum = sum + products[i].price * products[i].count;
  }
  return formatNumber(sum);
}