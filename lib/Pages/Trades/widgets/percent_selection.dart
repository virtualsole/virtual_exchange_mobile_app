import 'package:flutter/material.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/app_theme.dart';

class PercentSelection extends StatefulWidget {
  final ValueChanged<List<String>>? onSelection;

  const PercentSelection({this.onSelection, Key? key}) : super(key: key);

  @override
  State<PercentSelection> createState() => _PercentSelectionState();
}

class _PercentSelectionState extends State<PercentSelection> {
  List<String> percentValuesList = <String>[
    "25%",
    "50%",
    "75%",
    "100%",
  ];

  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: percentValuesList
          .map(
            (e) => Expanded(
              child: GestureDetector(
                onTap: () {
                  int selectedIndex = percentValuesList.indexOf(e);
                  int numberOfSelectedButtons = selectedIndex + 1;

                  selectedValues = percentValuesList.sublist(0, numberOfSelectedButtons);

                  widget.onSelection!(selectedValues);
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: selectedValues.contains(e) ? AppColors.primaryColor : Colors.transparent,
                    border: Border.all(
                      color: selectedValues.contains(e)
                          ? AppColors.primaryColor
                          : Colors.grey.shade400,
                      width: .4,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    style: TextStyle(
                      fontSize: 10,
                      color: selectedValues.contains(e)
                          ? Colors.black
                          : (themeProvider.darkMode ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
