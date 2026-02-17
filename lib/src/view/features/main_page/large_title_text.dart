import 'package:flutter/material.dart';

class LargeTitleText extends StatelessWidget {
  final String text;
  const LargeTitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
