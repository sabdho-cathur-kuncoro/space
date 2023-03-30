import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/home_category_items.dart';
import 'package:space/widgets/product_grid_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Chair',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const Spacer(),
              Image.asset(
                'assets/icon_search.png',
                width: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/icon_filter.png',
                width: 24,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 10,
          ),
          const HomeCategoryItems(
              title: 'Minimalis Chair',
              subtitle: 'Chair',
              imageUrl: 'assets/image_product_category1.png'),
          const SizedBox(
            height: 24,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 18,
            runSpacing: 18,
            children: const [
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid1.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: true),
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid2.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: true),
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid3.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: false),
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid4.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: false),
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid1.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: true),
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid2.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: false),
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid3.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: false),
              ProductGridItem(
                  imageUrl: 'assets/image_product_grid4.png',
                  title: 'Poan Chair',
                  price: 30,
                  isWishlist: false),
            ],
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
