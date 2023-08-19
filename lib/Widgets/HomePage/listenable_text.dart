import 'package:flutter/material.dart';

class ListenableText extends StatelessWidget {
  final String text;
  final Color color;
  const ListenableText(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: color, fontWeight: FontWeight.bold),
    );
  }
}
