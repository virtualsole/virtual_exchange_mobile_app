// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/Providers/home_page_provider.dart';
import 'package:virtual_exchange/Views/LandingPages/FuturesPages/future_page.dart';
import 'package:virtual_exchange/Views/LandingPages/HomePages/home_page.dart';
import 'package:virtual_exchange/Views/LandingPages/MarketsPages/market_page.dart';
import 'package:virtual_exchange/Views/LandingPages/TradePages/trade_page.dart';
import 'package:virtual_exchange/Views/LandingPages/WalletsPages/wallet_page.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> screens = const <Widget>[
    HomePage(),
    MarketPage(),
    TradePage(),
    FuturesPage(),
    WalletPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
            Provider.of<HomePageProvider>(context, listen: false).homePageCtrl.animateToPage(index,
                duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ImageRes.navBarHomeIcon,
                  color: currentIndex == 0 ? AppColors.primaryColor : null,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ImageRes.navBarMarketIcon,
                  color: currentIndex == 1 ? AppColors.primaryColor : null,
                ),
                label: "Markets"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ImageRes.navBarTradesIcon,
                  color: currentIndex == 2 ? AppColors.primaryColor : null,
                ),
                label: "Trade"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ImageRes.navBarFutureIcon,
                  color: currentIndex == 3 ? AppColors.primaryColor : null,
                ),
                label: "Futures"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ImageRes.navBarWalletIcon,
                  color: currentIndex == 4 ? AppColors.primaryColor : null,
                ),
                label: "Wallets"),
          ],
          currentIndex: currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: Provider.of<HomePageProvider>(context, listen: false).homePageCtrl,
          children: screens,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
