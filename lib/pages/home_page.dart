import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/home_category_items.dart';
import 'package:space/widgets/home_popular_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: kWhiteColor,
          onTap: (value) {
            if (value == 1) {
              Navigator.pushNamed(context, '/wishlist');
            } else if (value == 2) {
              Navigator.pushNamed(context, '/profile');
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_home.png',
                  width: 24,
                  color: kBlueColor,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_heart.png',
                  width: 24,
                ),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_profile.png',
                  width: 24,
                ),
                label: 'Profile'),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/image_background.png'),
          ListView(
            children: [
              // NOTE: TITLE
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo_dark.png',
                      width: 53,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Space',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: bold),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icon_cart.png',
                      width: 30,
                    )
                  ],
                ),
              ),
              // NOTE: SEARCH
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search Furniture',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      Image.asset(
                        'assets/icon_search.png',
                        width: 24,
                        color: kGreyColor,
                      )
                    ],
                  ),
                ),
              ),
              // NOTE: CATEGORY TITLE
              Container(
                margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    Text(
                      'Show All',
                      style: blackTextStyle,
                    )
                  ],
                ),
              ),
              // NOTE: CATEGORY CAROUSEL
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: CarouselSlider(
                  items: const [
                    HomeCategoryItems(
                        title: 'Minimalis Chair',
                        subtitle: 'Chair',
                        imageUrl: 'assets/image_product_category1.png'),
                    HomeCategoryItems(
                        title: 'Minimalis Table',
                        subtitle: 'Table',
                        imageUrl: 'assets/image_product_category2.png'),
                    HomeCategoryItems(
                        title: 'Minimalis Chair',
                        subtitle: 'Chair',
                        imageUrl: 'assets/image_product_category3.png'),
                  ],
                  options: CarouselOptions(
                      height: 140,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (index, _) {
                        setState(() {
                          categoryIndex = index;
                        });
                      }),
                ),
              ),
              // NOTE: CATEGORY CAROUSEL INDICATOR
              Container(
                margin: const EdgeInsets.only(top: 13, left: 24, right: 24),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 0 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: categoryIndex == 1
                              ? kBlackColor
                              : kLineDarkColor),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: categoryIndex == 2
                              ? kBlackColor
                              : kLineDarkColor),
                    ),
                  ],
                ),
              ),
              // NOTE: POPULAR SECTION
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(40)),
                    color: kWhiteColor,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 24, left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular',
                              style: blackTextStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold),
                            ),
                            Text('Show All', style: blackTextStyle,),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: 320,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(right: 24),
                          child: Row(
                            children: const [
                              HomePopularItems(title: 'Poan Chair', imageUrl: 'assets/image_product_category3.png', price: 30, isWishlist: true),
                              HomePopularItems(title: 'Poan Table', imageUrl: 'assets/image_product_category2.png', price: 30, isWishlist: false),
                              HomePopularItems(title: 'Poan Chair', imageUrl: 'assets/image_product_category1.png', price: 30, isWishlist: false),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
