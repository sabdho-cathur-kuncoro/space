import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space/theme.dart';

class ProductGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;
  final bool isWishlist;

  const ProductGridItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.isWishlist});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width - 82) / 2,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ $price',
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                Image.asset(
                  isWishlist
                      ? 'assets/btn_wishlist_active.png'
                      : 'assets/btn_wishlist.png',
                  width: 40,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
