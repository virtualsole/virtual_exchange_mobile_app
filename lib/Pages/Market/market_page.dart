import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_exchange/Pages/Market/Pages/SpotPages/spot_page.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/app_theme.dart';
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
    const SpotPage(),
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Market',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: themeProvider.darkMode ? Colors.white : Colors.black,
              size: size.width / 16.0,
            ),
          ),
          const SizedBox(width: 4.0),
        ],
        bottom: TabBar(
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
          tabs: ["Favourites", "Spot", "Future", "Feed", "Data"]
              .map((e) => SizedBox(
                    width: size.width * .15,
                    child: Tab(
                      text: e,
                    ),
                  ))
              .toList(),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 2.5,
            ),
            // _buildTopBar(context),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _pages.map(
                  (Widget tab) {
                    return tab;
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildTopBar(context) {
  //   final size = MediaQuery.of(context).size;
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           flex: 2,
  //           child: Text(
  //             'Pairs',
  //             style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 1,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 'Last Price',
  //                 style:
  //                     Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
  //               ),
  //               const SizedBox(width: 4.0),
  //               Icon(
  //                 FontAwesomeIcons.sort,
  //                 color: themeProvider.darkMode ? Colors.white : Colors.black,
  //                 size: size.width / 26.0,
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           flex: 1,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               Text(
  //                 'Change',
  //                 style:
  //                     Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
  //               ),
  //               const SizedBox(
  //                 width: 4.0,
  //               ),
  //               Icon(
  //                 FontAwesomeIcons.sort,
  //                 color: themeProvider.darkMode ? Colors.white : Colors.black,
  //                 size: size.width / 26.0,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
