import 'dart:async';

import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLightMode = true;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: opacity,
      child: Scaffold(
        backgroundColor:
            isLightMode ? kWhiteGreyColor : const Color(0xff1F1D2B),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: isLightMode ? kWhiteColor : kDarkBackgroundColor,
            onTap: (value) {
              if (value == 0) {
                Navigator.pushNamed(context, '/home');
              } else if (value == 1) {
                Navigator.pushNamed(context, '/wishlist');
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_home.png',
                    width: 24,
                    color: isLightMode ? kBlackColor : kWhiteColor,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_heart.png',
                    width: 24,
                    color: isLightMode ? kBlackColor : kWhiteColor,
                  ),
                  label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_profile.png',
                    width: 24,
                    color: kBlueColor,
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/image_background.png',
              color: isLightMode ? null : const Color(0xffD8D8D8),
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 24),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/image_profile.png',
                              width: 120,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Theresa Web',
                              style: blackTextStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: medium,
                                  color:
                                      isLightMode ? kBlackColor : kWhiteColor),
                            )
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLightMode = !isLightMode;
                              opacity = 0;
                            });

                            Timer(const Duration(milliseconds: 400), () {
                              setState(() {
                                opacity = 1;
                              });
                            });
                          },
                          child: Container(
                            width: 88,
                            height: 44,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: isLightMode
                                  ? kWhiteColor
                                  : kDarkBackgroundColor,
                            ),
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 400),
                              alignment: isLightMode
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Image.asset(
                                isLightMode
                                    ? 'assets/icon_switch_dark.png'
                                    : 'assets/icon_switch_light.png',
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(36)),
                    color: isLightMode ? kWhiteColor : kDarkBackgroundColor,
                  ),
                  child: Column(
                    children: [
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_profile.png',
                        title: 'My Profile',
                        isLightMode: isLightMode,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_address.png',
                        title: 'My Address',
                        isLightMode: isLightMode,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_shop.png',
                        title: 'My Order',
                        isLightMode: isLightMode,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_payment.png',
                        title: 'Payment Method',
                        isLightMode: isLightMode,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_heart.png',
                        title: 'My Wishlist',
                        isLightMode: isLightMode,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_faq.png',
                        title: 'Frequently Asked Questions',
                        isLightMode: isLightMode,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_cs.png',
                        title: 'Customer Care',
                        isLightMode: isLightMode,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
