import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Views/LandingPages/MarketsPages/favorite_tab_page.dart';
import 'package:virtual_exchange/Views/LandingPages/MarketsPages/future_tab_view.dart';
import 'package:virtual_exchange/Views/LandingPages/MarketsPages/spot_tab_page.dart';
import 'package:virtual_exchange/string_and_consts.dart';

import 'zone_tab_view.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.themeColor, borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                const Icon(Icons.search).paddingOnly(right: 20),
                Text(
                  "Search Coin",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.greyText,
                      ),
                )
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 2.5),
          ).paddingSymmetric(horizontal: 10, vertical: 10),
          const SizedBox().paddingOnly(bottom: 10),
          TabBar(
            controller: tabController,
            indicatorColor: AppColors.primaryColor,
            labelStyle: Theme.of(context).textTheme.bodySmall,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
            tabs: const [
              Tab(text: "Favorite"),
              Tab(text: "Spot"),
              Tab(text: "Futures"),
              Tab(text: "Zones"),
            ],
          ).paddingOnly(right: 70),
          Expanded(
            child: TabBarView(controller: tabController, children: const [
              FavoriteTabPage(),
              SpotTabPage(),
              FutureTabPage(),
              ZoneTabPage(),
            ]),
          ),
        ],
      ),
    );
  }
}
