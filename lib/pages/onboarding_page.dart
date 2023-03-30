import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/onboarding_items.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: CarouselSlider(
            items: const [
              OnboardingItems(
                imageUrl: 'assets/image_onboarding1.png',
                title: 'Buy Furniture Easily',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              ),
              OnboardingItems(
                imageUrl: 'assets/image_onboarding2.png',
                title: 'Fast Delivery',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              ),
              OnboardingItems(
                imageUrl: 'assets/image_onboarding3.png',
                title: 'Best Price',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              ),
            ],
            options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                initialPage: currentIndex,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            carouselController: controller,
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.jumpToPage(2);
                    },
                    child: Text('SKIP',
                        style: blackTextStyle.copyWith(fontSize: 18))),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 0 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 1 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 2 ? kBlackColor : kLineDarkColor,
                      ),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {
                      if (currentIndex == 2) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/sign-in', (route) => false);
                      } else {
                        controller.nextPage();
                      }
                    },
                    child: Text('NEXT',
                        style: blackTextStyle.copyWith(fontSize: 18)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
