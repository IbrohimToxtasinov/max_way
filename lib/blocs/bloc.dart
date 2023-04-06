import 'package:flutter/material.dart';
import 'package:max_way/data/max_way_data/max_way_data.dart';
import 'package:max_way/data/models/category/category_model.dart';
import 'package:max_way/data/models/product/product_model.dart';

class SomeBloc with ChangeNotifier {
  List<CategoryTab> tabs = [];
  List<MaxWayItem> items = [];
  TabController? tabController;
  ScrollController scrollController = ScrollController();
  bool _listen = true;

  void init(TickerProvider tickerProvider) {
    tabController =
        TabController(length: maxWayCategories.length, vsync: tickerProvider);
    double offsetFrom = 0.0;
    double offsetTo = 0.0;
    for (int i = 0; i < maxWayCategories.length; i++) {
      final category = maxWayCategories[i];

      if (i > 0) {
        offsetFrom += maxWayCategories[i - 1].products.length * 175;
      }
      if (i < maxWayCategories.length - 1) {
        offsetTo = offsetFrom + maxWayCategories[i + 1].products.length * 175;
      } else {
        offsetTo = double.infinity;
      }

      tabs.add(CategoryTab(
        category: category,
        selected: (i == 0),
        offsetFrom: 70 * i + offsetFrom,
        offsetTo: offsetTo,
      ));

      items.add(MaxWayItem(category: category));
      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(MaxWayItem(product: product));
      }
    }
    scrollController.addListener(_onScrollListener);
  }

  void _onScrollListener() {
    if (_listen) {
      for (int i = 0; i < maxWayCategories.length; i++) {
        final tab = tabs[i];
        if (scrollController.offset >= tab.offsetFrom &&
            scrollController.offset <= tab.offsetTo &&
            !tab.selected) {
          onCategorySelected(i, animationRequired: false);
          tabController?.animateTo(i);
          break;
        }
      }
    }
  }

  void onCategorySelected(int index, {bool animationRequired = true}) async {
    final selected = tabs[index];
    for (int i = 0; i < maxWayCategories.length; i++) {
      final condition = selected.category.name == tabs[i].category.name;
      tabs[i] = tabs[i].copyWith(condition);
    }
    notifyListeners();

    if (animationRequired) {
      _listen = false;
      await scrollController.animateTo(
        selected.offsetFrom,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      _listen = true;
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    tabController?.dispose();
    super.dispose();
  }
}

class CategoryTab {
  final MaxWayCategory category;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;

  CategoryTab({
    required this.offsetTo,
    required this.category,
    required this.selected,
    required this.offsetFrom,
  });

  CategoryTab copyWith(bool selected) => CategoryTab(
        offsetTo: offsetTo,
        category: category,
        selected: selected,
        offsetFrom: offsetFrom,
      );
}

class MaxWayItem {
  MaxWayCategory? category;
  MaxWayProduct? product;

  MaxWayItem({this.category, this.product});

  bool get isCategory => category != null;
}
