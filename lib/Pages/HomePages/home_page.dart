import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Pages/HomePages/widgets/home_search.dart';
import 'package:virtual_exchange/Pages/Notification/notification_page.dart';
import 'package:virtual_exchange/Pages/suport_web_view.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Models/change.dart';
import 'package:virtual_exchange/app_theme.dart';

import '../AuthPages/auth_page.dart';
import 'qr_scan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  StreamController? _postsController;
  Timer? timer;

  // String _api = ''; // Find a API can get Binance Data
  String _option = 'Change';
  final bool _showAppBar = true;

  var _current = 0;
  List imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq_5VpdtZ8TDPpG1B5E9TAcbCgz1l10joxMw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQksGYjFxzY0ClfferWS3_FA83Sjyd8yhPgCw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJO51rTdGAi2z2z8MkQuhRuLV0RFuAFM42Rw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvy2tSrJ7nPZetcBk9l9zq6bh6okbtR8jJJw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2qyzS6LPb0UaeBjiK_HruTOduID7FSMf1Cg&usqp=CAU',
  ];

  final List<String> _notices = [
    'Subscribe VRC Youtube Channel...',
    'Subscribe VRC Facebook Channel...',
    'Subscribe VRC Twitter Channel...',
    'Subscribe VRC Instagram Channel...',
    'Subscribe VRC Gapo Channel...',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  void changePosition(int i) {
    setState(() {
      if (_current == 4 && i == 1) {
        _current = 0;
      } else if (_current == 0 && i == -1) {
        _current = 4;
      } else {
        _current += i;
      }
    });
  }

  @override
  void initState() {
    _postsController = StreamController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _showAppBar
          ? AppBar(
              elevation: .0,
              backgroundColor: Colors.transparent,
              centerTitle: false,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginPage());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        FontAwesomeIcons.user,
                        color: themeProvider.darkMode ? Colors.white : Colors.black,
                        size: size.width / 22.5,
                      ),
                    ),
                  ).paddingOnly(right: 10),
                  const HomeSearchWidget(),
                ],
              ),
              actions: [
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.qrcode_viewfinder,
                    color: themeProvider.darkMode ? Colors.black : Colors.white,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext _) {
                          return const QRViewPage();
                        },
                      ),
                    );
                  },
                ).paddingOnly(right: 10),
                GestureDetector(
                  child: Icon(
                    Icons.headset_mic_outlined,
                    color: themeProvider.darkMode ? Colors.black : Colors.white,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext _) {
                      return const SupportWebView();
                    }));
                  },
                ).paddingOnly(right: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return const Notifications();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.notifications,
                    color: themeProvider.darkMode ? Colors.black : Colors.white,
                    size: 20,
                  ),
                ).paddingOnly(right: 10),
                GestureDetector(
                  onTap: () {
                    themeProvider.changeTheme();
                  },
                  child: Icon(
                    Icons.dark_mode,
                    color: themeProvider.darkMode ? Colors.white : Colors.black,
                    size: 20,
                  ),
                ).paddingOnly(right: 20),
              ],
            )
          : null,
      body: SingleChildScrollView(
        controller: _controller,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * .175,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * .12,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(4.0, 12.0, 6.0, 14.0),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: Colors.grey.shade300,
                              width: .4,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Icon(
                                  FontAwesomeIcons.bullhorn,
                                  color: Colors.grey.shade400,
                                  size: size.width / 24.0,
                                ),
                                const SizedBox(width: 8.0),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.5),
                                  child: Text(
                                    _notices[_current],
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: size.width / 30.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '12-13',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ).paddingSymmetric(horizontal: 20),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          StreamBuilder(
                            stream: _postsController?.stream,
                            builder: (context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Row(
                                    children: [
                                      _buildNoticeCoins(
                                        context,
                                        'BTCUSDT',
                                        '+4.56%',
                                        34.3017,
                                        const Color(0xFF00FF80),
                                      ),
                                      _buildNoticeCoins(
                                        context,
                                        'ETHUSDT',
                                        '+ 4.56%',
                                        1107.2242,
                                        const Color(0xFFFF3232),
                                      ),
                                      _buildNoticeCoins(
                                        context,
                                        'EOSUSDT',
                                        '+4.56%',
                                        3.0216,
                                        const Color(0xFF00FF80),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              return Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Row(
                                  children: [
                                    _buildNoticeCoins(
                                      context,
                                      'BTCUSDT',
                                      '+4.56%',
                                      double.parse(snapshot.data['RAW']['PRICE'].toString()),
                                      const Color(0xFF00FF80),
                                    ),
                                    _buildNoticeCoins(
                                      context,
                                      'ETHUSDT',
                                      '+ 4.56%',
                                      double.parse(snapshot.data['RAW']['PRICE'].toString()),
                                      const Color(0xFFFF3232),
                                    ),
                                    _buildNoticeCoins(
                                      context,
                                      'EOSUSDT',
                                      '+4.56%',
                                      double.parse(snapshot.data['RAW']['PRICE'].toString()),
                                      const Color(0xFF00FF80),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Material(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 12.0,
                                ),
                                _buildQuickAccess(context, 'Futures Guide', Icons.transcribe),
                                _buildQuickAccess(
                                  context,
                                  'Insurance',
                                  Icons.shield_moon_outlined,
                                ),
                                _buildQuickAccess(
                                  context,
                                  'Option\' Guide',
                                  // Feather.book_open,
                                  Icons.transcribe_outlined,
                                ),
                                _buildQuickAccess(
                                  context,
                                  'Chat',
                                  // Feather.headphones,
                                  Icons.chat_outlined,
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 10, vertical: 20),
                          ).paddingSymmetric(horizontal: 10, vertical: 20),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              'Hot Options',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 14.0),
                              _buildOptionsItem(context, 'Change'),
                              const SizedBox(width: 10.0),
                              _buildOptionsItem(context, 'Volume'),
                              const SizedBox(width: 10.0),
                              _buildOptionsItem(context, 'Leverage'),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ...changes.map((item) {
                            return _buildChangeLine(
                              context,
                              item.title,
                              item.value,
                              item.percent,
                              item.increase,
                            );
                          }).toList(),
                          const SizedBox(
                            height: 24.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * .1,
              left: 0.0,
              child: Container(
                margin: const EdgeInsets.only(left: 8.0, right: 12.0),
                height: size.height * .18,
                width: size.width,
                child: _buildCarouselImage(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticeCoins(
    context,
    title,
    percent,
    double value,
    color,
  ) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                percent,
                style: TextStyle(
                  color: color,
                  fontSize: size.width / 28.8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2.5,
          ),
          Text(
            '$value',
            style: TextStyle(
              color: color,
              fontSize: size.width / 22.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 2.5,
          ),
          Text(
            '≈ \$${value.round()}',
            style: TextStyle(
              color: color,
              fontSize: size.width / 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(context, title, icon) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: size.width / 16.8,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsItem(context, title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _option = title;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _option == title ? AppColors.primaryColor : null,
            borderRadius: BorderRadius.circular(2.5)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: _option == title ? FontWeight.bold : null,
              ),
        ).paddingSymmetric(horizontal: 10, vertical: 5),
      ),
    );
  }

  Widget _buildChangeLine(context, title, value, percent, increase) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: .25,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 6.0, 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF00FF80).withOpacity(.08),
              borderRadius: BorderRadius.circular(4.0),
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '+$percent%',
              style: TextStyle(
                color: const Color(0xFF00FF80),
                fontSize: size.width / 24.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselImage(context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * .165,
        aspectRatio: 1.5,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      items: imgList.map((imgUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Row(
              children: [
                Container(
                  height: size.height * .16,
                  width: size.width * .7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imgList[_current]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Container(
                  height: size.height * .165,
                  width: size.width * .275,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: _current == 4
                          ? NetworkImage(imgList[0])
                          : NetworkImage(imgList[_current + 1]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
