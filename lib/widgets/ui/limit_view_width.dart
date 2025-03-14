import 'package:flutter/material.dart';
import 'package:watch_habour/utils/utils.dart';

class LimitViewWidth extends StatelessWidget {
  const LimitViewWidth({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: AppDimensions.vw(context, 100, max: minTabletWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
