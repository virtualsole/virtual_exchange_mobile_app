import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class MarginMode extends StatefulWidget {
  final ValueChanged<String>? onChange;

  const MarginMode({this.onChange, super.key});

  @override
  State<MarginMode> createState() => _MarginModeState();
}

class _MarginModeState extends State<MarginMode> {
  String? initValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Margin Mode", style: Theme.of(context).textTheme.bodyMedium),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ["Cross", "Isolate", "Split"]
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.onChange != null) widget.onChange!(e);
                      initValue = e;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(
                        .3,
                      ),
                    ),
                    child: Text(
                      e,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(
                          color: initValue == e ? Colors.white : Colors.grey.withOpacity(.5)),
                    ).paddingSymmetric(horizontal: 20, vertical: 5),
                  ),
                ),
              )
              .toList(),
        ).paddingOnly(bottom: 10),
        Text("Switching of Margin mode only applies only to the selected contract",
                style: Theme.of(context).textTheme.bodyMedium)
            .paddingOnly(bottom: 10),
        Text(
          "What are Cross, Isolated and Split mode ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.greyText,
              ),
        ).paddingOnly(bottom: 10),

        /// Cross Mode
        RichText(
          text: TextSpan(
            text: 'Cross Margin Mode: ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text:
                    "All the cross position under the same margin asset share the same asset cross "
                    "margin balance in the event of liquidation, your asset full margin balance along with"
                    "any remaining open position under the asset may be forfeited  ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyText,
                    ),
              )
            ],
          ),
        ).paddingOnly(bottom: 10),

        /// Isolated Mode

        RichText(
          text: TextSpan(
            text: 'Isolated Margin Mode: ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text:
                    "Margin assigned to a position is restricted to a certain amount, if the margin"
                    " rates is less then or equal to 0, the position is liquidated, how ever you can add "
                    "or remove margin at will under this method ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyText,
                    ),
              )
            ],
          ),
        ).paddingOnly(bottom: 10),

        /// Split Mode

        RichText(
          text: TextSpan(
            text: 'Split Margin Mode: ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Transfer a certain amount of margin tho the corresponding account"
                    " if the margin rate is less then ot equal to 0, the position will be liquidated"
                    " and trader may loss all the margin in the account",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyText,
                    ),
              )
            ],
          ),
        ).paddingOnly(bottom: 20),
        AppButton(
          "Confirm",
          onTap: () {
            Get.back();
          },
        ).paddingOnly(bottom: 10)
      ],
    ).paddingSymmetric(horizontal: 20, vertical: 20);
  }
}
