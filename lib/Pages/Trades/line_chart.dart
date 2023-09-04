import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/app_theme.dart';

import 'widgets/line_chart.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BTC/USDT",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: LineChartSample2(),
    );
  }
}
