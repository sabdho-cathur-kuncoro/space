import 'package:flutter/material.dart';

import '../theme.dart';

class OnboardingItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const OnboardingItems(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 99,
        ),
        Image.asset(
          imageUrl,
          width: double.infinity,
        ),
        const SizedBox(
          height: 127,
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 26),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: greyTextStyle.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
