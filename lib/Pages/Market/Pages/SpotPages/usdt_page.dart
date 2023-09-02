import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsdtPages extends StatelessWidget {
  const UsdtPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("Name", style: Theme.of(context).textTheme.bodySmall),
              Stack(
                children: [
                  const Icon(Icons.arrow_drop_up, size: 20),
                  const Icon(Icons.arrow_drop_down, size: 20).paddingOnly(top: 8),
                ],
              ),
              Text("/", style: Theme.of(context).textTheme.bodySmall),
              Text("Vol", style: Theme.of(context).textTheme.bodySmall),
              Stack(
                children: [
                  const Icon(Icons.arrow_drop_up, size: 20),
                  const Icon(Icons.arrow_drop_down, size: 20).paddingOnly(top: 8),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
              Row(
                children: [
                  Text("Last Price", style: Theme.of(context).textTheme.bodySmall),
                  Stack(
                    children: [
                      const Icon(Icons.arrow_drop_up, size: 20),
                      const Icon(Icons.arrow_drop_down, size: 20).paddingOnly(top: 8),
                    ],
                  ),
                ],
              ).paddingOnly(right: 25),
              Row(
                children: [
                  Text("24h Chg%", style: Theme.of(context).textTheme.bodySmall),
                  Stack(
                    children: [
                      const Icon(Icons.arrow_drop_up, size: 20),
                      const Icon(Icons.arrow_drop_down, size: 20).paddingOnly(top: 8),
                    ],
                  ),
                ],
              )
            ],
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildFavouriteCard(context);
            },
          )
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }

  Widget _buildFavouriteCard(context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        ///
        ///
        ///
        // Get.to(()=>LineChart());
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'VRC/',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'BTC',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    'Volume: 72.837',
                    style: TextStyle(
                      fontSize: size.width / 28.0,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0.000000031',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00FF80).withOpacity(.15),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      '+3.33%',
                      style: TextStyle(
                        fontSize: size.width / 30.0,
                        color: const Color(0xFF00FF80),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
