import 'package:flutter/material.dart';
import 'package:virtual_exchange/Plugins/Flutter_Icons/lib/flutter_icons.dart';
import 'package:virtual_exchange/src/pages/home/home_page.dart';
import 'package:virtual_exchange/src/pages/market/market_page.dart';
import 'package:virtual_exchange/src/pages/options/options_page.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPage = 0;
  var _pages = [
    HomePage(),
    MarketPage(),
    OptionsPage(),
    OptionsPage(),
    OptionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: .0,
          backgroundColor: Color(0xFF1e1e1e).withOpacity(.98),
          currentIndex: currentPage,
          onTap: (int i) {
            setState(() {
              currentPage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: _size.width / 15.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey.shade400,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Dashboard")),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ("Market")),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.trade_federation_faw5d), label: ("Trades")),
            BottomNavigationBarItem(icon: Icon(Icons.fitbit_outlined), label: ("Futures")),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: ("Wallet")),
          ],
        ),
        body: _pages[currentPage],
      ),
    );
  }
}
