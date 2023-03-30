import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/product_grid_item.dart';
import 'package:space/widgets/skeleton_item.dart';
import 'package:space/widgets/product_list_items.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool isLoading = true;
  bool isShowGrid = true;

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 110),
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
                ),
                const SizedBox(
                  width: 18,
                ),
                Image.asset(
                  'assets/icon_filter.png',
                  width: 24,
                ),
              ],
            ),
            bottom: TabBar(
              indicatorColor: kBlackColor,
              labelColor: kBlackColor,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: 'Chair',
                ),
                Tab(
                  text: 'Table',
                ),
                Tab(
                  text: 'Accessories',
                ),
                Tab(
                  text: 'Living Room',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildBody(),
            buildBody(),
            buildBody(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Result for: Poan',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowGrid = !isShowGrid;
                });
              },
              child: Image.asset(
                isShowGrid ? 'assets/icon_list.png' : 'assets/icon_grid.png',
                width: 24,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        isLoading
            ? buildLoading()
            : isShowGrid
                ? buildGrid()
                : buildList(),
        // buildList(),
      ],
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

  Widget buildList() {
    return Column(
      children: const [
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
    );
  }
}
