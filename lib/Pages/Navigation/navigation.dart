import 'package:flutter/material.dart';
import 'package:virtual_exchange/Pages/WalletsPages/wallet_page.dart';
import 'package:virtual_exchange/Pages/HomePages/home_page.dart';
import 'package:virtual_exchange/Pages/market/market_page.dart';
import 'package:virtual_exchange/Pages/options/options_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPage = 0;
  final _pages = [
    const HomePage(),
    const MarketPage(),
    const OptionsPage(),
    const OptionsPage(),
    const WalletPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: .0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: currentPage,
          onTap: (int i) {
            setState(() {
              currentPage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: size.width / 15.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey.shade400,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Dashboard")),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ("Market")),
            BottomNavigationBarItem(icon: Icon(Icons.add_chart_rounded), label: ("Trades")),
            BottomNavigationBarItem(icon: Icon(Icons.fitbit_outlined), label: ("Futures")),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: ("Wallet")),
          ],
        ),
        body: _pages[currentPage],
      ),
    );
  }
}
