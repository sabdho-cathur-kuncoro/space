import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class HomeCategoryItems extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const HomeCategoryItems(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/category');
      },
      child: Container(
        height: 123,
        width: MediaQuery.of(context).size.width - (2 * 24),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: kWhiteColor,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          subtitle,
                          style: greyTextStyle.copyWith(fontWeight: semiBold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Image.asset(imageUrl, height: 122,)
          ],
        ),
      ),
    );
  }
}
