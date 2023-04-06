import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_way/data/models/product/product_model.dart';
import 'package:max_way/ui/home/widgets/product_detail.dart';
import 'package:max_way/utils/formatter.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);

  final MaxWayProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: const Radius.circular(30).r,
              ),
            ),
            builder: (BuildContext context) {
              return ProductDetail(product: product);
            },
          );
        },
        child: Container(
          height: 170,
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 16, top: 20, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: const Color(0xFF979797).withOpacity(0.4),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                product.image,
                width: 130,
                height: 130,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(
                          0XFF222124,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0XFF222124).withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${formatNumber(product.price)} so'm",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(
                          0XFF222124,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
