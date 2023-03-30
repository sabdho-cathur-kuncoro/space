import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space/theme.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final int price;
  final String imageUrl;

  const ProductListItem(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: Row(
        children: [
          Image.asset(
                imageUrl,
                width: 60,
              ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              const SizedBox(height: 6,),
              Text(
                '\$ $price',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }
}
