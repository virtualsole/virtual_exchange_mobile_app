import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:virtual_exchange/Widgets/progress_bar.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class SpotTabPage extends StatefulWidget {
  const SpotTabPage({super.key});

  @override
  State<SpotTabPage> createState() => _SpotTabPageState();
}

class _SpotTabPageState extends State<SpotTabPage> {
  String initValue = "USDTH";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: ["USDTH", "BTC", "ETH"]
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          initValue = e;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: e == initValue ? Colors.grey.withOpacity(.3) : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(e, style: Theme.of(context).textTheme.bodySmall)
                              .paddingSymmetric(horizontal: 10, vertical: 2.5),
                        ).paddingSymmetric(horizontal: 2.5),
                      ),
                    )
                    .toList(),
              ),
              const Expanded(child: SizedBox()),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey.withOpacity(.3)),
                child: const Icon(Icons.add_chart, size: 15).paddingAll(5),
              ).paddingOnly(right: 10),
            ],
          ).paddingOnly(bottom: 20, top: 20),
          const AppProgressBar(),
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Name"),
                upDownIcon(),
                const Text("Vol"),
                upDownIcon(),
              ],
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Last Price"),
                upDownIcon(),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Chg%"),
                upDownIcon(),
              ],
            ),
          ).paddingOnly(bottom: 5),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          // style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(text: 'ET', style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(text: '/', style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: 'USDT',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const Text("Total: 332.5M"),
                    ],
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3.9889",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$3.98",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                        color: AppColors.redColor, borderRadius: BorderRadius.circular(5)),
                    child: Text("-0.53%", style: Theme.of(context).textTheme.bodySmall)
                        .paddingSymmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                ).paddingOnly(bottom: 5);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget upDownIcon() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(Icons.arrow_drop_up_outlined), Icon(Icons.arrow_drop_down_outlined)],
    );
  }
}
