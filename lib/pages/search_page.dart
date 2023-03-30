import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/product_list_items.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kWhiteColor,
          elevation: 0,
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
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: kWhiteGreyColor,
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        textInputAction: TextInputAction.go,
                        onFieldSubmitted: (value) {
                          Navigator.pushNamed(context, '/search-result');
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText: 'Search Furniture'),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.close,
                        color: kGreyColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 41,
          ),
          Text(
            'Recomendation',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 20,
          ),
          ProductListItem(
              title: 'Poan Chair',
              price: 30,
              imageUrl: 'assets/image_product_list1.png'),
          ProductListItem(
              title: 'Poan Chair',
              price: 30,
              imageUrl: 'assets/image_product_list2.png'),
          ProductListItem(
              title: 'Poan Chair',
              price: 30,
              imageUrl: 'assets/image_product_list3.png'),
          ProductListItem(
              title: 'Poan Chair',
              price: 30,
              imageUrl: 'assets/image_product_list4.png'),
        ],
      ),
    );
  }
}
