import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String review;
  final List<String> items;

  const ReviewItem(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.review,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 50,
          ),
          const SizedBox(
            width: 35,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                  ),
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                  ),
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                  ),
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                  ),
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text.rich(TextSpan(text: review, style: greyTextStyle, children: [
                TextSpan(
                  text: 'more',
                  style: blackTextStyle,
                )
              ])),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items
                      .map((item) => Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Image.asset(
                              item,
                              width: 72,
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
