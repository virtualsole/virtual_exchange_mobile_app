import 'package:flutter/material.dart';

import 'package:virtual_exchange/app_theme.dart';

class BuySellButton extends StatefulWidget {
  final ValueChanged<String>? onSelection;

  const BuySellButton({this.onSelection, super.key});

  @override
  State<BuySellButton> createState() => _BuySellButtonState();
}

class _BuySellButtonState extends State<BuySellButton> {
  String selected = 'Buy';

  List<String> valuesList = <String>["Buy", "Sell"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade400),
      child: Row(
        children: valuesList
            .map(
              (e) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onSelection!(e);
                    setState(
                      () {
                        selected = e;
                      },
                    );
                  },
                  child: Material(
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: selected == e ? AppColors.primaryColor : Colors.grey.withOpacity(.5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        style: Theme.of(
                          context,
                        )
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
