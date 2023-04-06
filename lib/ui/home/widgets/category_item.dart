import 'package:flutter/material.dart';
import 'package:max_way/data/models/category/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  final MaxWayCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: Text(
        category.name,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),
    );
  }
}
