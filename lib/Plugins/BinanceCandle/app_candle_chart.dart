import 'dart:convert';
import './candle_ticker_model.dart';
import './repository.dart';
import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AppCandleChart extends StatefulWidget {
  const AppCandleChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppCandleChartState();
}

class _AppCandleChartState extends State<AppCandleChart> {
  BinanceRepository repository = BinanceRepository();

  List<Candle> candles = [];
  WebSocketChannel? _channel;

  String currentInterval = "1m";
  final intervals = [
    '1m',
    '3m',
    '5m',
    '15m',
    '30m',
    '1h',
    '2h',
    '4h',
    '6h',
    '8h',
    '12h',
    '1d',
    '3d',
    '1w',
    '1M',
  ];
  List<String> symbols = [];
  String currentSymbol = "";
  List<Indicator> indicators = [
    BollingerBandsIndicator(
      length: 20,
      stdDev: 2,
      upperColor: const Color(0xFF2962FF),
      basisColor: const Color(0xFFFF6D00),
      lowerColor: const Color(0xFF2962FF),
    ),
    WeightedMovingAverageIndicator(
      length: 100,
      color: Colors.green.shade600,
    ),
  ];

  @override
  void initState() {
    fetchSymbols().then((value) {
      symbols = value;
      if (symbols.isNotEmpty) fetchCandles(symbols[0], currentInterval);
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_channel != null) _channel!.sink.close();
    super.dispose();
  }

  Future<List<String>> fetchSymbols() async {
    try {
      final data = await repository.fetchSymbols();
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<void> fetchCandles(String symbol, String interval) async {
    if (_channel != null) {
      _channel!.sink.close();
      _channel = null;
    }
    setState(() {
      candles = [];
      currentInterval = interval;
    });

    try {
      final data = await repository.fetchCandles(symbol: symbol, interval: interval);
      _channel = repository.establishConnection(symbol.toLowerCase(), currentInterval);
      setState(() {
        candles = data;
        currentInterval = interval;
        currentSymbol = symbol;
      });
    } catch (e) {
      return;
    }
  }

  void updateCandlesFromSnapshot(AsyncSnapshot<Object?> snapshot) {
    if (candles.isEmpty) return;
    if (snapshot.data != null) {
      final map = jsonDecode(snapshot.data as String) as Map<String, dynamic>;
      if (map.containsKey("k") == true) {
        final candleTicker = CandleTickerModel.fromJson(map);

        if (candles[0].date == candleTicker.candle.date &&
            candles[0].open == candleTicker.candle.open) {
          candles[0] = candleTicker.candle;
        } else if (candleTicker.candle.date.difference(candles[0].date) ==
            candles[0].date.difference(candles[1].date)) {
          candles.insert(0, candleTicker.candle);
        }
      }
    }
  }

  Future<void> loadMoreCandles() async {
    try {
      final data = await repository.fetchCandles(
          symbol: currentSymbol,
          interval: currentInterval,
          endTime: candles.last.date.millisecondsSinceEpoch);
      candles.removeLast();
      setState(() {
        candles.addAll(data);
      });
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Example Candles Chart"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _channel == null ? null : _channel!.stream,
            builder: (context, snapshot) {
              updateCandlesFromSnapshot(snapshot);
              return Candlesticks(
                key: Key(currentSymbol + currentInterval),
                indicators: indicators,
                candles: candles,
                onLoadMoreCandles: loadMoreCandles,
                onRemoveIndicator: (String indicator) {
                  setState(() {
                    indicators = [...indicators];
                    indicators.removeWhere((element) => element.name == indicator);
                  });
                },
                actions: [
                  ToolBarAction(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              width: 200,
                              color: Theme.of(context).colorScheme.background,
                              child: Wrap(
                                children: intervals
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 30,
                                            child: RawMaterialButton(
                                              elevation: 0,
                                              fillColor: const Color(0xFF494537),
                                              onPressed: () {
                                                fetchCandles(currentSymbol, e);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Color(0xFFF0B90A),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      currentInterval,
                    ),
                  ),
                  ToolBarAction(
                    width: 100,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SymbolsSearchModal(
                            symbols: symbols,
                            onSelect: (value) {
                              fetchCandles(value, currentInterval);
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      currentSymbol,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SymbolsSearchModal extends StatefulWidget {
  const SymbolsSearchModal({
    Key? key,
    required this.onSelect,
    required this.symbols,
  }) : super(key: key);

  final Function(String symbol) onSelect;
  final List<String> symbols;

  @override
  State<SymbolsSearchModal> createState() => _SymbolSearchModalState();
}

class _SymbolSearchModalState extends State<SymbolsSearchModal> {
  String symbolSearch = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          height: MediaQuery.of(context).size.height * 0.75,
          color: Theme.of(context).colorScheme.background.withOpacity(0.5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onChanged: (value) {
                    setState(() {
                      symbolSearch = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: widget.symbols
                      .where(
                          (element) => element.toLowerCase().contains(symbolSearch.toLowerCase()))
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 50,
                              height: 30,
                              child: RawMaterialButton(
                                elevation: 0,
                                fillColor: const Color(0xFF494537),
                                onPressed: () {
                                  widget.onSelect(e);
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    color: Color(0xFFF0B90A),
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.onChanged}) : super(key: key);
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      cursorColor: const Color(0xFF494537),
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xFF494537),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Color(0xFF494537)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Color(0xFF494537)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Color(0xFF494537)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}