import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/product_grid_item.dart';
import 'package:space/widgets/skeleton_item.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), (() {
      setState(() {
        isLoading = false;
      });
    }));
    super.initState();
  }
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
                'Wishlist',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const Spacer(),
              Image.asset(
                'assets/icon_search.png',
                width: 24,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: kWhiteColor,
          onTap: (value) {
            if (value == 0) {
              Navigator.pushNamed(context, '/home');
            } else if (value == 2) {
              Navigator.pushNamed(context, '/profile');
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_home.png',
                  width: 24,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_heart.png',
                  width: 24,
                  color: kBlueColor,
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 24,),
          isLoading ? buildLoading() : buildGrid(),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: const [
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
      ],
    );
  }

  Widget buildGrid() {
    return Wrap(
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
    );
  }
}