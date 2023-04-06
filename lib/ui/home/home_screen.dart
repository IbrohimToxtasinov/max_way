import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:max_way/blocs/bloc.dart';
import 'package:max_way/ui/home/widgets/advertisements_widget.dart';
import 'package:max_way/ui/home/widgets/category_item.dart';
import 'package:max_way/ui/home/widgets/product_item.dart';
import 'package:max_way/ui/home/widgets/tab_widgets.dart';
import 'package:max_way/utils/color.dart';
import 'package:max_way/utils/constans.dart';
import 'package:max_way/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _bloc = SomeBloc();

  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: SvgPicture.asset(AppImages.maxWayLogo),
        actions: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: MyColors.brandColor900)),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, cartPage);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25.w,
                  color: MyColors.brandColor900,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: AnimatedBuilder(
        animation: _bloc,
        builder: (context, child) => Column(
          children: [
            SizedBox(height: 10.h),
            const AdvertisementsWidget(),
            SizedBox(height: 10.h),
            Container(
              color: Colors.white,
              height: 60,
              child: TabBar(
                onTap: _bloc.onCategorySelected,
                controller: _bloc.tabController,
                isScrollable: true,
                indicatorWeight: 0.005,
                tabs: _bloc.tabs
                    .map((element) => TabWidget(categoryTab: element))
                    .toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _bloc.scrollController,
                itemCount: _bloc.items.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  final item = _bloc.items[index];
                  if (item.isCategory) {
                    return CategoryItem(category: item.category!);
                  } else {
                    return ProductItem(product: item.product!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
