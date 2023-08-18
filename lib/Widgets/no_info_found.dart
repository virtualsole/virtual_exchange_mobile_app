import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class NoInfoFound extends StatelessWidget {
  const NoInfoFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            ImageRes.noInformationFound,
            color: Colors.grey,
            height: 100,
            width: 100,
          ),
          Text("No Information Found", style: Theme.of(context).textTheme.bodyLarge)
        ],
      ),
    );
  }
}
