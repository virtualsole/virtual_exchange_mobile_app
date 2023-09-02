import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/data/type_coin.dart';

class EndDrawerLayout extends StatefulWidget {
  const EndDrawerLayout({super.key});

  @override
  State<StatefulWidget> createState() => _EndDrawerLayoutState();
}

class _EndDrawerLayoutState extends State<EndDrawerLayout> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> _listData = [];

  @override
  void initState() {
    super.initState();
    _listData.addAll(btcs);
    _tabController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF1e1e1e),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
            ],
          ),
          SizedBox(
            height: size.height / 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'Options',
              style: TextStyle(
                color: Colors.grey.shade50,
                fontSize: size.width / 24.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          TabBar(
            onTap: (index) {
              setState(() {
                _listData.clear();
                if (index % 2 == 0) {
                  _listData.addAll(btcs);
                } else {
                  _listData.addAll(eths);
                }
              });
            },
            isScrollable: true,
            controller: _tabController,
            labelColor: AppColors.primaryColor,
            indicatorColor: AppColors.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.75,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 28.0),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: size.width / 28.0,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: size.width / 28.0,
            ),
            tabs: [
              SizedBox(
                width: size.width * .1,
                child: const Tab(
                  text: 'BTC',
                ),
              ),
              SizedBox(
                width: size.width * .1,
                child: const Tab(
                  text: 'ETH',
                ),
              ),
              SizedBox(
                width: size.width * .1,
                child: const Tab(
                  text: 'EOS',
                ),
              ),
              SizedBox(
                width: size.width * .1,
                child: const Tab(
                  text: 'CTC',
                ),
              ),
              SizedBox(
                width: size.width * .1,
                child: const Tab(
                  text: 'BNB',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ..._listData
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 16.0),
                  child: Row(
                    children: [
                      Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 23.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
