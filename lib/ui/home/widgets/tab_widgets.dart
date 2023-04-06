import 'package:flutter/material.dart';
import 'package:max_way/blocs/bloc.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({Key? key, required this.categoryTab}) : super(key: key);

  final CategoryTab categoryTab;

  @override
  Widget build(BuildContext context) {
    final selected = categoryTab.selected;
    return Container(
      height: 46,
      width: 104,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: const Color(0XFFF1B301)),
          borderRadius: BorderRadius.circular(27),
          color: selected ? const Color(0XFFF1B301) : const Color(0XffFFFFFF)),
      child: Center(
        child: Text(
          categoryTab.category.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: selected ? const Color(0XffFFFFFF) : const Color(0Xff000000),
          ),
        ),
      ),
    );
  }
}
