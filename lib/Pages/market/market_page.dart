import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:virtual_exchange/Plugins/Flutter_Icons/lib/flutter_icons.dart';

import 'pages/favourite_page.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<StatefulWidget> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final _pages = [
    const FavouritePage(),
    const FavouritePage(),
    const FavouritePage(),
    const FavouritePage(),
    const FavouritePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: .0,
        backgroundColor: const Color(0xFF1e1e1e).withOpacity(.98),
        title: Text(
          'Market',
          style: TextStyle(
            fontSize: size.width / 16.0,
            color: Colors.grey.shade100,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Feather.search,
              color: Colors.grey.shade100,
              size: size.width / 16.0,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: const Color(0xFFFFD500),
          indicatorColor: const Color(0xFFFFD500),
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
              width: size.width * .2,
              child: const Tab(
                text: 'Favourites',
              ),
            ),
            SizedBox(
              width: size.width * .15,
              child: const Tab(
                text: 'Cross',
              ),
            ),
            SizedBox(
              width: size.width * .15,
              child: const Tab(
                text: 'Isolated',
              ),
            ),
            SizedBox(
              width: size.width * .15,
              child: const Tab(
                text: 'Options',
              ),
            ),
            SizedBox(
              width: size.width * .15,
              child: const Tab(
                text: 'BTC',
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        color: const Color(0xFF141414),
        child: Column(
          children: [
            const SizedBox(
              height: 2.5,
            ),
            _buildTopBar(context),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _pages.map((Widget tab) {
                  return tab;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Pairs',
              style: TextStyle(
                fontSize: size.width / 26.0,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last Price',
                  style: TextStyle(
                    fontSize: size.width / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Icon(
                  FontAwesomeIcons.sort,
                  color: Colors.grey.shade400,
                  size: size.width / 26.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Change',
                  style: TextStyle(
                    fontSize: size.width / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Icon(
                  FontAwesomeIcons.sort,
                  color: Colors.grey.shade400,
                  size: size.width / 26.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
