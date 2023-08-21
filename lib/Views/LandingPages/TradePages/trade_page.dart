// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/string_and_consts.dart';
import '../../../Widgets/no_info_found.dart';
import 'spot_trade_tab_page.dart';

class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              indicatorColor: AppColors.primaryColor,
              labelStyle: Theme.of(context).textTheme.bodySmall,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
              tabs: const [
                Tab(text: "Spot"),
                Tab(text: "P2P"),
              ],
            ).paddingOnly(right: MediaQuery.of(context).size.width * .5),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
                Text("ET/USTD",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const Expanded(child: SizedBox()),
                SvgPicture.asset(ImageRes.tradeIcon, color: Colors.white, height: 20),
                SvgPicture.asset(ImageRes.arrowDown, color: Colors.white, height: 5)
                    .paddingOnly(right: 10),
                SvgPicture.asset(ImageRes.doubleTradeIcon, color: Colors.white, height: 20)
                    .paddingOnly(right: 10),
                const Icon(Icons.more_vert, size: 20),
              ],
            ).paddingOnly(right: 10),
            SizedBox(height: Get.height * .45, child: const SpotTradingBuyOrSell()),
            const OpenOrOrderSelection(),
            const NoInfoFound()
          ],
        ),
      ),
    );
  }
}

class OpenOrOrderSelection extends StatefulWidget {
  const OpenOrOrderSelection({super.key});

  @override
  State<OpenOrOrderSelection> createState() => _OpenOrOrderSelectionState();
}

class _OpenOrOrderSelectionState extends State<OpenOrOrderSelection> {
  String selectedValue = "Open";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: ["Open", "Order"]
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                selectedValue = e;
                                setState(() {});
                              },
                              child: Text(e).paddingOnly(right: 10)),
                          if (selectedValue == e)
                            Container(height: 2, width: 25, color: AppColors.primaryColor),
                        ],
                      ))
                  .toList(),
            ).paddingOnly(bottom: 5),
            const Expanded(child: SizedBox()),
            const Icon(Icons.notes).paddingOnly(right: 10)
          ],
        ),
        Container(width: Get.width, height: 1, color: Colors.grey).paddingOnly(bottom: 10)
      ],
    );
  }
}
