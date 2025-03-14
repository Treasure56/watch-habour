import 'package:flutter/material.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/widgets.dart';

class LabelLine extends StatelessWidget {
  const LabelLine(this.title, this.value, {super.key});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    Widget textWidget(String text) {
      return Expanded(
          child: AppText.small(
        text,
        weight: FontWeight.w500,
        size: size * 2.5,
        textAlign: TextAlign.right,
        maxLines: 3,
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: size),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.small(title, size: size * 2.5),
            const SizedBox(width: size * 4),
            textWidget(value),
          ]),
    );
  }
}
