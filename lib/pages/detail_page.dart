import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/review_item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color indicatorColor = const Color(0xff394A54);
  double indicatorMargin = 5;
  int currentIndex = 1;
  bool isExpand = false;
  bool isShowReview = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      extendBody: true,
      body: Stack(
        children: [
          Image.asset('assets/image_background.png'),
          Container(
            margin: const EdgeInsets.only(top: 95),
            child: Image.asset('assets/image_detail$currentIndex.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 66),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhiteColor,
                  border: Border.all(
                    color: kLineDarkColor,
                  )),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.45,
              minChildSize: 0.45,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(40)),
                    color: kWhiteColor,
                  ),
                  child: NotificationListener(
                    onNotification: (Notification notif) {
                      if (notif is ScrollEndNotification) {
                        if (notif.metrics.minScrollExtent == -1) {
                          setState(() {
                            isExpand = true;
                          });
                        } else {
                          setState(() {
                            isExpand = false;
                            isShowReview = false;
                          });
                        }
                      }
                      return true;
                    },
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: Container(
                                width: 50,
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kLineDarkColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Poan Chair',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 24, fontWeight: semiBold),
                                ),
                                Text(
                                  '\$ 30',
                                  style: blackTextStyle.copyWith(fontSize: 24),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'IKOE',
                              style: blackTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 50,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Row(
                                    children: [
                                      colorIndicator(Color(0xff394A54), 0),
                                      colorIndicator(Color(0xffEBA823), 1),
                                      colorIndicator(Color(0xff757477), 2),
                                      colorIndicator(Color(0xff29282C), 3),
                                      colorIndicator(Color(0xffECE9DA), 4),
                                    ],
                                  ),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: 40,
                                    height: 40,
                                    margin:
                                        EdgeInsets.only(left: indicatorMargin),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: indicatorColor,
                                      border: Border.all(
                                          width: 3, color: kWhiteColor),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                  height: 1.6),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                  height: 1.6),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                  height: 1.6),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                  height: 1.6),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                  height: 1.6),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            isShowReview
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Review',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 24, fontWeight: semiBold),
                                      ),
                                      const SizedBox(height: 10,),
                                      const ReviewItem(
                                          name: 'Lydia Clayton',
                                          imageUrl:
                                              'assets/image_reviewer1.png',
                                          review:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                          items: [
                                            'assets/image_product_list1.png',
                                            'assets/image_product_list2.png',
                                            'assets/image_product_list3.png'
                                          ]),
                                      const ReviewItem(
                                          name: 'Audra Still',
                                          imageUrl:
                                              'assets/image_reviewer2.png',
                                          review:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                          items: [
                                            'assets/image_product_list3.png',
                                            'assets/image_product_list2.png',
                                          ]),
                                      const ReviewItem(
                                          name: 'Joan Gray',
                                          imageUrl:
                                              'assets/image_reviewer3.png',
                                          review:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                          items: [
                                            'assets/image_product_list4.png',
                                          ]),
                                    ],
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: isShowReview
          ? null
          : isExpand
              ? Container(
                  width: double.infinity,
                  height: 315,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        kWhiteColor.withOpacity(0.5),
                        kWhiteColor,
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isShowReview = true;
                            });
                          },
                          child: Text('See more',
                              style: blueTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold)))
                    ],
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: kGreyColor,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: kWhiteGreyColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                            child: Image.asset(
                          'assets/icon_cart.png',
                          width: 24,
                        )),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        height: 56,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: kBlackColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          child: Text(
                            'Buy Now',
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
    );
  }

  Widget colorIndicator(Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indicatorColor = color;
          indicatorMargin = 5 + (index * 66);
          currentIndex = index + 1;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
