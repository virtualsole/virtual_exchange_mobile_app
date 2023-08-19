import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Views/LandingPages/FuturesPages/furute_statics_page.dart';
import 'package:virtual_exchange/string_and_consts.dart';
import '../../../Widgets/no_info_found.dart';

class FuturesPage extends StatefulWidget {
  const FuturesPage({super.key});

  @override
  State<FuturesPage> createState() => _FuturesPageState();
}

class _FuturesPageState extends State<FuturesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
                Text("BTC/USTD",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 50),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.redColor.withOpacity(.3)),
                  child: Text("-2.18%",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.redColor))
                      .paddingAll(4),
                ),
                const Expanded(child: SizedBox()),
                SvgPicture.asset(ImageRes.tradeIcon, color: Colors.white, height: 20),
                SvgPicture.asset(ImageRes.arrowDown, color: Colors.white, height: 5)
                    .paddingOnly(right: 10),
                SvgPicture.asset(ImageRes.doubleTradeIcon, color: Colors.white, height: 20)
                    .paddingOnly(right: 10),
                const Icon(Icons.more_vert, size: 20),
              ],
            ).paddingOnly(right: 10),
            SizedBox(height: Get.height * .45, child: const FutureStaticsPage()),
            const OpenOrOrderSelection(),
            const NoInfoFound()
          ],
        ),
      ),
    );
  }
}

class OpenOrOrderSelection extends StatefulWidget {
  const OpenOrOrderSelection({super.key});

  @override
  State<OpenOrOrderSelection> createState() => _OpenOrOrderSelectionState();
}

class _OpenOrOrderSelectionState extends State<OpenOrOrderSelection> {
  String selectedValue = "Positions";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: ["Positions(0)", "Limits(0)", "Stop Limits(0)"]
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                selectedValue = e;
                                setState(() {});
                              },
                              child: Text(e).paddingOnly(right: 10)),
                          if (selectedValue == e)
                            Container(height: 2, width: 25, color: AppColors.primaryColor)
                                .paddingOnly(bottom: 10),
                        ],
                      ))
                  .toList(),
            ).paddingOnly(bottom: 5),
            const Expanded(child: SizedBox()),
            const Icon(Icons.notes).paddingOnly(right: 10)
          ],
        ),
        Container(width: Get.width, height: 1, color: Colors.grey).paddingOnly(bottom: 10)
      ],
    );
  }
}
