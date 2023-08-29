import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_exchange/Plugins/Flutter_Icons/lib/flutter_icons.dart';

import 'widgets/drawer_layout.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

  @override
  State<StatefulWidget> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController? _postsController;
  Timer? timer;
  final String _api =
      'https://min-api.cryptocompare.com/data/generateAvg?fsym=BTC&tsym=USD&e=Kraken&api_key=5b5a7685ff31b6033f79ffc43c778605d47ca3a84a7d690ec510149ccb0e7f50';

  String _action = 'Buy';
  double _valueCustom = 9.9902;

  List sampleData = List.generate(
    10,
    (int index) => {
      "open": 100.0,
      "high": 500.0,
      "low": 50.0,
      "close": 100,
      "volumeto": 5000.0,
    },
  );

  Future fetchPost() async {
    final response = await http.get(Uri.parse(_api));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController?.add(res);
      return res;
    });
  }

  Future<void> _handleRefresh() async {
    // fetchPost().then((res) async {
    //   _postsController?.add(res);
    //   setState(() {
    //     sampleData.add(
    //       {
    //         "open": double.parse(res['RAW']['PRICE'].toString()),
    //         "high": double.parse(res['RAW']['PRICE'].toString()),
    //         "low": double.parse(res['RAW']['PRICE'].toString()),
    //         "close": double.parse(res['RAW']['PRICE'].toString()),
    //         "volumeto": double.parse(res['RAW']['PRICE'].toString()),
    //       },
    //     );
    //     sampleData.removeAt(0);
    //     print(sampleData);
    //   });
    //   return null;
    // });
    return;
  }

  startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 200), (t) {
      setState(() {
        _handleRefresh();
      });
    });
  }

  @override
  void initState() {
    _postsController = StreamController();
    loadPosts();
    startTimer();
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: size.width * .7,
        child: const Drawer(
          child: DrawerLayout(),
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        elevation: .0,
        backgroundColor: const Color(0xFF1e1e1e).withOpacity(.98),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(
            Feather.align_left,
            color: Colors.grey.shade100,
            size: size.width / 15.0,
          ),
        ),
        title: Text(
          'ETH0107CALLW',
          style: TextStyle(
            fontSize: size.width / 18.0,
            color: Colors.grey.shade100,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Feather.bar_chart_2,
              color: Colors.grey.shade50,
              size: size.width / 15.0,
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
              width: size.width * .15,
              child: const Tab(
                text: 'Trade',
              ),
            ),
            SizedBox(
              width: size.width * .15,
              child: const Tab(
                text: 'Short',
              ),
            ),
            SizedBox(
              width: size.width * .15,
              child: const Tab(
                text: 'Position',
              ),
            ),
            SizedBox(
              width: size.width * .15,
              child: const Tab(
                text: 'History',
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        color: const Color(0xFF141414),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4.0,
              ),
              _buildTopBar(context),
              _buildValueOfTopBar(context),
              // Container(
              //   height: _size.height * .2,
              //   margin: EdgeInsets.symmetric(vertical: 12.0),
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   child: OHLCVGraph(
              //     data: sampleData,
              //     enableGridLines: true,
              //     volumeProp: .001,
              //     fallbackHeight: 200.0,
              //     gridLineAmount: 6,
              //     lineWidth: .8,
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 6.0,
                  bottom: 24.0,
                  top: 12.0,
                ),
                child: Row(
                  children: [
                    _buildLeftColumn(context),
                    const SizedBox(width: 16.0),
                    _buildRightColumn(context),
                  ],
                ),
              ),

              Container(
                height: 10.0,
                color: const Color(0xFF1e1e1e),
              ),

              // Build Active Orders
              SizedBox(
                height: size.height * .4,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                      child: Text(
                        'Active Orders',
                        style: TextStyle(
                          fontSize: size.width / 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: .35,
                      height: .35,
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Feather.file,
                              color: Colors.grey.shade400,
                              size: size.width / 16.8,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'No order',
                                style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: size.width / 20.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              'Strike Price',
              style: TextStyle(
                fontSize: size.width / 30.0,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Spot Price',
                  style: TextStyle(
                    fontSize: size.width / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Before Enpiry',
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
                  FontAwesomeIcons.sortDown,
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

  Widget _buildValueOfTopBar(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 2.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              '750.04',
              style: TextStyle(
                fontSize: size.width / 26.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1112.24',
                  style: TextStyle(
                    fontSize: size.width / 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '1 Day',
                  style: TextStyle(
                    fontSize: size.width / 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftColumn(context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildAction(context, 'Buy', true),
            _buildAction(context, 'Sell', false),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6.0, 8.0, 4.0, 8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade600,
              width: .5,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Custom',
                style: TextStyle(
                  fontSize: size.width / 32.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 6.0,
                ),
                child: Icon(
                  FontAwesomeIcons.sortDown,
                  color: Colors.grey.shade400,
                  size: size.width / 26.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        _buildCustomValue(context),
        const SizedBox(
          height: 12.0,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(.0, 8.0, 4.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available',
                style: TextStyle(
                  fontSize: size.width / 32.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '0.00USDT',
                style: TextStyle(
                  fontSize: size.width / 32.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        _buildCustomValue(context),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            _buildPercentCard(context, '25%'),
            const SizedBox(width: 4.0),
            _buildPercentCard(context, '50%'),
            const SizedBox(width: 4.0),
            _buildPercentCard(context, '75%'),
            const SizedBox(width: 4.0),
            _buildPercentCard(context, '100%'),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: const Color(0xFF32C17A),
          ),
          alignment: Alignment.center,
          child: Text(
            _action,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: size.width / 24.0,
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildAction(context, title, left) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _action = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: _action == title ? Colors.amber : Colors.white10,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(
                left ? 2.5 : .0,
              ),
              right: Radius.circular(
                left ? .0 : 2.5,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: size.width / 28.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomValue(context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _valueCustom -= .1;
              });
            },
            child: Container(
              height: 36.0,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(
                    6.0,
                  ),
                ),
                border: Border.all(
                  color: Colors.white24,
                  width: .4,
                ),
              ),
              child: Icon(
                Feather.minus,
                color: Colors.grey.shade200,
                size: size.width / 20.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 36.0,
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey.shade400,
                  width: .25,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              _valueCustom.toStringAsFixed(4),
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w300,
                fontSize: size.width / 30.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _valueCustom += .1;
              });
            },
            child: Container(
              height: 36.0,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(
                    6.0,
                  ),
                ),
                border: Border.all(
                  color: Colors.white24,
                  width: .4,
                ),
              ),
              child: Icon(
                Feather.plus,
                color: Colors.grey.shade200,
                size: size.width / 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPercentCard(context, title) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white38,
            width: .4,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: size.width / 40.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Widget _buildRightColumn(context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: size.width / 28.8,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: size.width / 28.8,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          _buildValuePriceLine(context, '10.1682', '312', const Color(0xFFFF3232)),
          _buildValuePriceLine(context, '9.4289', '1112', const Color(0xFFFF3232)),
          _buildValuePriceLine(context, '3.3152', '122', const Color(0xFFFF3232)),
          _buildValuePriceLine(context, '7.1482', '512', const Color(0xFFFF3232)),
          _buildValuePriceLine(context, '11.282', '212', const Color(0xFFFF3232)),
          Container(
            padding: const EdgeInsets.only(bottom: 16.0, top: 20.0),
            alignment: Alignment.center,
            child: Text(
              '9.5129 ≈ \$9.51',
              style: TextStyle(
                fontSize: size.width / 28.5,
                color: Colors.grey.shade100,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _buildValuePriceLine(context, '10.1682', '312', const Color(0xFF00FF80)),
          _buildValuePriceLine(context, '9.4289', '1112', const Color(0xFF00FF80)),
          _buildValuePriceLine(context, '3.3152', '122', const Color(0xFF00FF80)),
          _buildValuePriceLine(context, '7.1482', '512', const Color(0xFF00FF80)),
          _buildValuePriceLine(context, '11.282', '212', const Color(0xFF00FF80)),
        ],
      ),
    );
  }

  Widget _buildValuePriceLine(context, price, amount, color) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            price,
            style: TextStyle(
              fontSize: size.width / 30.0,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: size.width / 30.0,
              color: Colors.grey.shade200,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
