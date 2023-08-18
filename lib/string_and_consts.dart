import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class ImageRes {
  static String appLogo = "";
  static String noInformationFound = "assets/Svg/no_info_found.svg";

  /// Navigation Bar
  static String navBarHomeIcon = "assets/Svg/NavBar/home.svg";
  static String navBarMarketIcon = "assets/Svg/NavBar/market.svg";
  static String navBarTradesIcon = "assets/Svg/NavBar/trade.svg";
  static String navBarFutureIcon = "assets/Svg/NavBar/future.svg";
  static String navBarWalletIcon = "assets/Svg/NavBar/wallet.svg";

  /// Announcement Icons
  static String superStart = "assets/Svg/VirtualExchangeIcons/Super Start.svg";
  static String academy = "assets/Svg/VirtualExchangeIcons/Academy.svg";
  static String deposit = "assets/Svg/VirtualExchangeIcons/Deposit.svg";
  static String referral = "assets/Svg/VirtualExchangeIcons/Referral.svg";
  static String oneVUsd = "assets/Svg/VirtualExchangeIcons/1Vusd.svg";
  static String mysteryBox = "assets/Svg/VirtualExchangeIcons/Mystery Box.svg";
  static String order = "assets/Svg/VirtualExchangeIcons/Order.svg";
  static String chatSupport = "assets/Svg/VirtualExchangeIcons/Chat.svg";
  static String spotTrading = "assets/Svg/VirtualExchangeIcons/Spot Trading.svg";
  static String p2p = "assets/Svg/VirtualExchangeIcons/p2p.svg";

  static String announcementFutures = "assets/Svg/VirtualExchangeIcons/futures.svg";
  static String announcementSpotTrading = "assets/Svg/VirtualExchangeIcons/spot_trading.svg";
  static String tradeIcon = "assets/Svg/trade_icon.svg";
  static String doubleTradeIcon = "assets/Svg/double_trade_icon.svg";
  static String arrowUp = "assets/Svg/Arrow_up.svg";
  static String arrowDown = "assets/Svg/Arrow_down.svg";
  static String menuIcon = "assets/Svg/Menu_Icon.svg";
  static String filterIcon = "assets/Svg/Filter_Icon.svg";
}

class AppColors {
  static int themeColorCode = 0xff1D2129;
  static Color themeColor = Color(themeColorCode);
  static int primaryColorCode = 0xff00A5FF;
  static Color primaryColor = Color(primaryColorCode);
  static Color secondaryColor = (Colors.orangeAccent);
  static Color dividerColor = const Color(0xff35383D);
  static Color greenColor = const Color(0xff26744b);
  static Color scaffoldBackgroundColor = const Color(0xff0C0C0C);
  static Color greyText = const Color(0xff979697);
  static Color redColor = const Color(0xffF74243);
}
